//
//  LineChartView.swift
//  CoronavirusData
//  Test file to figure out how to create a Line Chart for daily data
//
//  Created by Shane on 28/09/2020.
//

import SwiftUI

struct LineChartView: View {
    let measurements: [DayInfo] = Bundle.main.decode("day-info.json")
    var maxValue = 0.0
    var minValue = 0.0
    
    var body: some View {
        GeometryReader { reader in
            ForEach(self.measurements, id: \.date) { measurement in
                Path { p in
                    let dayWidth = self.dayWidth(reader.size.width, count: self.measurements.count)
                    let measurementHeight = self.measurementHeight(reader.size.height, range: Int(self.maxValue))
                    let dayOffset = self.dayOffset(measurement.date, dWidth: dayWidth)
//                    let lowOffset = tempOffset(measurement.value, degreeHeight: dHeight)
                    let lowOffset = CGFloat(0)
                    let highOffset = self.measurementHeightOffset(measurement.value, measurementHeight: measurementHeight)
                    p.move(to: CGPoint(x: dayOffset, y: reader.size.height - lowOffset))
                    p.addLine(to: CGPoint(x: dayOffset, y: reader.size.height - highOffset))
                }.stroke()
            }
        }
    }
    
    init() {
        // Is this the best place to calculate this?  It will work on
        // current data to hand and not have to worry about pre-processing the information
        setMaxAndMinValuesFrom(measurements: measurements)
    }
    
    func measurementHeight(_ height: CGFloat, range: Int) -> CGFloat {
        return height / CGFloat(range)
    }
    
    func dayWidth(_ width: CGFloat, count: Int) -> CGFloat {
        return width / CGFloat(count)
    }
    
    func dayOffset(_ date: Date, dWidth: CGFloat) -> CGFloat {
        return CGFloat(Calendar.current.ordinality(of: .day, in: .year, for: date)!) * dWidth
    }
    
    func measurementHeightOffset(_ temperature: Double, measurementHeight: CGFloat) -> CGFloat {
        return CGFloat(temperature + 10) * measurementHeight
    }
    
    mutating func setMaxAndMinValuesFrom(measurements: [DayInfo]) {
        for measurement in measurements {
            if measurement.value > maxValue {
                maxValue = measurement.value
            }
            if measurement.value < minValue {
                minValue = measurement.value
            }
        }
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView()
    }
}
