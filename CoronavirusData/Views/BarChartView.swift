//
//  BarChart.swift
//  CoronavirusData
//  Test file to figure out how to create a Bar Chart for daily data
//
//  Created by Shane on 28/09/2020.
//

import SwiftUI

struct BarChartView: View {
    let measurements: [DayInfo] = Bundle.main.decode("day-info.json")
    var maxValue = 0.0
    var minValue = 0.0
    
    var body: some View {
        GeometryReader { reader in
            HStack {
                ForEach(measurements, id: \.date) { measurement in
                    VStack {
                        Spacer()
                        Text("\(measurement.value, specifier: "%.1f")")
                            .font(.footnote)
                            .rotationEffect(.degrees(-90), anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .fixedSize()
                        Rectangle()
                            .fill(Color.blue)
                            .frame(
                                width: getWidthForValue(in: reader.size.width, for: measurements.count),
                                height: getHeightFor(value: measurement.value, in: reader.size.height)
                            )
                    }
                }
            }
        }
    }
    
    init() {
        // Is this the best place to calculate this?  It will work on
        // current data to hand and not have to worry about pre-processing the information
        setMaxAndMinValuesFrom(measurements: measurements)
    }
    
    func getHeightFor(value: Double, in viewHeight: CGFloat) -> CGFloat {
        let height = CGFloat(viewHeight * CGFloat(value / maxValue))
        return height
    }
    
    func getWidthForValue(in viewWidth: CGFloat, for valueCount: Int) -> CGFloat {
        return viewWidth / CGFloat(valueCount)
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

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
