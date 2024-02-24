//
//  ExamplesContentView.swift
//  BetterRest
//
//  Created by Mete Karakul on 17.02.2024.
//

import SwiftUI

struct ExamplesContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            DatePicker("Please enter a date", selection: $wakeUp)
            DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .date)
                .labelsHidden()
            DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
            let tomorrow = Date.now.addingTimeInterval(86400)
            Text("\(tomorrow)")
            Text("\(Date.now...tomorrow)")
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
                .labelsHidden()
            Text("\(getDate())")
            Text("\(getDateString())")
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.day().month().year())
            Text(Date.now.formatted(date: .long, time: .shortened))
        }
        .padding()
    }
    
    private func getDate() -> Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now
        return date
    }
    
    private func getDateString() -> String {
        var components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? .zero
        let minute = components.minute ?? .zero
        return "\(hour):\(minute)"
    }
}

#Preview {
    ContentView()
}
