//
//  LineChartView.swift
//  CoronavirusData
//  Test file to figure out how to create a Line Chart for daily data
//
//  Created by Shane on 28/09/2020.
//

import SwiftUI

struct Line: Shape {
    var from: CGPoint
    var to: CGPoint
    
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: self.from)
            p.addLine(to: self.to)
        }
    }
}

struct LineChart: View {
    var points: [CGPoint]
    
    var body: some View {
        Text("Draw the lines here")
    }
}

struct LineChartView: View {
    let measurements: [DayInfo] = Bundle.main.decode("day-info.json")
    var maxValue = 0.0
    var minValue = 0.0
    
    var body: some View {
        GeometryReader { reader in
//            Path { p in
//                p.move(to: CGPoint(x: CGFloat(0), y: CGFloat(reader.size.height)))
//                p.addLine(to: CGPoint(x: CGFloat(reader.size.width * 1/8), y: CGFloat(reader.size.height - (reader.size.height * 0/64))))
//                p.addLine(to: CGPoint(x: CGFloat(reader.size.width * 2/8), y: CGFloat(reader.size.height - (reader.size.height * 1/64))))
//                p.addLine(to: CGPoint(x: CGFloat(reader.size.width * 3/8), y: CGFloat(reader.size.height - (reader.size.height * 2/64))))
//                p.addLine(to: CGPoint(x: CGFloat(reader.size.width * 4/8), y: CGFloat(reader.size.height - (reader.size.height * 4/64))))
//                p.addLine(to: CGPoint(x: CGFloat(reader.size.width * 5/8), y: CGFloat(reader.size.height - (reader.size.height * 8/64))))
//                p.addLine(to: CGPoint(x: CGFloat(reader.size.width * 6/8), y: CGFloat(reader.size.height - (reader.size.height * 16/64))))
//                p.addLine(to: CGPoint(x: CGFloat(reader.size.width * 7/8), y: CGFloat(reader.size.height - (reader.size.height * 32/64))))
//                p.addLine(to: CGPoint(x: CGFloat(reader.size.width * 8/8), y: CGFloat(reader.size.height - (reader.size.height * 64/64))))
////                This will error
////                ForEach(self.measurements, id: \.date) { measurement in
////                    print("PL")
////                }
//            }.stroke()
            
            
            
            ForEach(self.measurements, id: \.date) { measurement in
                Line(from: CGPoint(x: 0, y: CGFloat(reader.size.height)), to: CGPoint(x: CGFloat(reader.size.width * 1/8), y: CGFloat(reader.size.height - (reader.size.height * 0/64))))
                    .stroke()
                    
                Line(from: CGPoint(x: CGFloat(reader.size.width * 1/8), y: CGFloat(reader.size.height - (reader.size.height * 0/64))), to: CGPoint(x: CGFloat(reader.size.width * 2/8), y: CGFloat(reader.size.height - (reader.size.height * 1/64))))
                    .stroke()
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
