//
//  ContentView.swift
//  WeatherForecast
//
//  Created by 李伟 on 2024/8/8.
//

import SwiftUI

struct ContentView: View {

    let days: [DayForecastData] = [
        DayForecastData(day: "Mon", high: 88, low: 50, isRainy: true),
        DayForecastData(day: "Tue", high: 60, low: 40, isRainy: true),
        DayForecastData(day: "Wed", high: 60, low: 40, isRainy: false),
        DayForecastData(day: "Thu", high: 60, low: 40, isRainy: true),
        DayForecastData(day: "Fri", high: 60, low: 40, isRainy: false),
        DayForecastData(day: "Sat", high: 60, low: 40, isRainy: true),

    ]

    var averageLow: Int {
        let totalLow = days.reduce(0) { $0 + $1.low }
        return days.isEmpty ? 0 : totalLow / days.count
    }

    var averageHigh: Int {
        return days.isEmpty ? 0 : days.reduce(0) { $0 + $1.high } / days.count
    }

    var sun: Int {
        let sunnyDays = days.filter { !$0.isRainy }
        return sunnyDays.count
    }  
    var rain: Int {
        let rainDays = days.filter { $0.isRainy }
        return rainDays.count
    }

    var body: some View {

        Text("Average Low: \(averageLow)")
                        .font(.headline)
                        .padding()    

        Text("Average High: \(averageHigh)")
                        .font(.headline)
                        .padding()  
        Text("Average sun: \(sun)")
                        .font(.headline)
                        .padding()   
        Text("Average rain: \(rain)")
                        .font(.headline)
                        .padding()



        ScrollView(.horizontal) {
            LazyHStack(spacing: 2) {
                ForEach(days) { day in
                    DayForecast(dayForecast: day)
                        .padding(.trailing)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let dayForecast: DayForecastData
    // 计算属性
    var color: Color {
        if dayForecast.high > 80 {
            return .yellow
        } else {
            return .black
        }
    }

    var body: some View {
        VStack {
            Text(dayForecast.day)
                .font(.headline)
            Image(systemName: dayForecast.isRainy ? "cloud.rain.fill" : "sun.max.fill")
                .foregroundColor(dayForecast.isRainy ? .blue : .yellow)
                .font(.largeTitle)
                .padding(5)
            Text("High: \(dayForecast.high)")
                .fontWeight(.semibold)
                .padding(.bottom, 2)
            Text("Low: \(dayForecast.low)")
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .padding(40)
        .foregroundStyle(color)
        .background(.green, in: RoundedRectangle(cornerRadius: 8))
    }
}

struct DayForecastData: Identifiable {
    let id = UUID()
    let day: String
    let high: Int
    let low: Int
    let isRainy: Bool
}
