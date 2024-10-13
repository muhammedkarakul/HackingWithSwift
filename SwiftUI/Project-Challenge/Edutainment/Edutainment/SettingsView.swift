//
//  ContentView.swift
//  Edutainment
//
//  Created by Muhammed Karakul on 21.04.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State private(set) var multiplicationNumber = 2
    @State private(set) var numberOfQuestions = 5
    
    private let numberOfQuestionOption: [Int] = [5, 10, 20]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Which multiplication table do you want to study?") {
                    Stepper("Number of multiplier: \(multiplicationNumber)", value: $multiplicationNumber, in: 2...12, step: 1)
                }
                
                Section("How many question do you want to ask??") {
                    
                    Picker("Number of questions", selection: $numberOfQuestions) {
                        ForEach(numberOfQuestionOption, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
