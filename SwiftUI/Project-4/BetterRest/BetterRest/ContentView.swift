//
//  ContentView.swift
//  BetterRest
//
//  Created by Mete Karakul on 17.02.2024.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    private static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now
        return date
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
//                    Text("When do you want to wake up?")
//                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section("Desired amount of sleep") {
//                    Text("Desired amount of sleep")
//                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section("Daily coffee intake") {
//                    Text("Daily coffee intake")
//                        .font(.headline)
                    
                    Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) {
                            Text("\($0)")
                        }
                    }
//                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
//                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                }
                
                Section(alertTitle) {
                    Text(alertMessage)
                        .font(.headline)
                }
            }
            .navigationTitle("BetterRest")
//            .toolbar {
//                Button("Calculate", action: calculateBedtime)
//            }
//            .alert(alertTitle, isPresented: $showingAlert) {
//                Button("OK") { }
//            } message: {
//                Text(alertMessage)
//            }
        }
    }
    
    private func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
