//
//  BarChart.swift
//  CoronavirusData
//  Test file to figure out how to create a Bar Chart for daily data
//
//  Created by Shane on 28/09/2020.
//

import SwiftUI

struct DayInfo {
    let value: Double
    let date: Date
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
}

struct BarChartView: View {
    var measurements: [DayInfo]
    var maxValue = 0.0
    var minValue = 0.0
    
    var body: some View {
        HStack {
            ForEach(measurements, id: \.date) { measurement in
                VStack {
                    Spacer()
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: getWidthFor(), height: getHeightFor(measurement.value))
                }
            }
        }
    }
    
    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // Better to load these from a JSON file or something
        measurements = [DayInfo]()
        measurements.append(DayInfo(value: 0, date: dateFormatter.date(from: "2020-09-01")!))
        measurements.append(DayInfo(value: 1, date: dateFormatter.date(from: "2020-09-02")!))
        measurements.append(DayInfo(value: 2, date: dateFormatter.date(from: "2020-09-03")!))
        measurements.append(DayInfo(value: 4, date: dateFormatter.date(from: "2020-09-04")!))
        measurements.append(DayInfo(value: 8, date: dateFormatter.date(from: "2020-09-05")!))
        measurements.append(DayInfo(value: 16, date: dateFormatter.date(from: "2020-09-06")!))
        measurements.append(DayInfo(value: 32, date: dateFormatter.date(from: "2020-09-07")!))
        measurements.append(DayInfo(value: 64, date: dateFormatter.date(from: "2020-09-08")!))
        
        // Is this the best place to calculate this?  It will work on
        // current data to hand and not have to worry about pre-processing the information
        setMaxAndMinFrom(measurements: measurements)
    }
    
    func getHeightFor(_ value: Double) -> CGFloat {
        // @todo this should be a function of the height available (use GeometryReader?)
        let height = CGFloat(800 * (value / maxValue))
        return height
    }
    
    func getWidthFor() -> CGFloat {
        // @todo this should be a function of the width available (use GeometryReader?)
        return 20.0
    }
    
    mutating func setMaxAndMinFrom(measurements: [DayInfo]) {
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

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
