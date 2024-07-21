//
//  ContentView.swift
//  Edutainment
//
//  Created by Muhammed Karakul on 21.04.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var multiplicationNumber = 2
    @State private var numberOfQuestions = 1
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Which multiplication table do you want to study?") {
                    Stepper("Number of multiplier: \(multiplicationNumber)", value: $multiplicationNumber, in: 2...12, step: 1)
                }
                
                Section("How many question do you want to ask??") {
                    Stepper("Number of questions: \(numberOfQuestions)", value: $numberOfQuestions, in: 1...20, step: 1)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
