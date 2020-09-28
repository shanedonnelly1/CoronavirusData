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
                    let dWidth = self.dayWidth(reader.size.width, count: 8)
                    let dHeight = self.degreeHeight(reader.size.height, range: 64)
                    let dOffset = self.dayOffset(measurement.date, dWidth: dWidth)
//                    let lowOffset = tempOffset(measurement.value, degreeHeight: dHeight)
                    let lowOffset = CGFloat(0)
                    let highOffset = self.tempOffset(measurement.value, degreeHeight: dHeight)
                    p.move(to: CGPoint(x: dOffset, y: reader.size.height - lowOffset))
                    p.addLine(to: CGPoint(x: dOffset, y: reader.size.height - highOffset))
                }.stroke()
            }
        }
    }
    
//    init() {
//        // Is this the best place to calculate this?  It will work on
//        // current data to hand and not have to worry about pre-processing the information
//        setMaxAndMinValuesFrom(measurements: measurements)
//    }
    
    func degreeHeight(_ height: CGFloat, range: Int) -> CGFloat {
        return height / CGFloat(range)
    }
    
    func dayWidth(_ width: CGFloat, count: Int) -> CGFloat {
        return width / CGFloat(count)
    }
    
    func dayOffset(_ date: Date, dWidth: CGFloat) -> CGFloat {
        return CGFloat(Calendar.current.ordinality(of: .day, in: .year, for: date)!) * dWidth
    }
    
    func tempOffset(_ temperature: Double, degreeHeight: CGFloat) -> CGFloat {
        return CGFloat(temperature + 10) * degreeHeight
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView()
    }
}
