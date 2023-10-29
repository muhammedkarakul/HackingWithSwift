//
//  CreatingPickersInForm.swift
//  Basics
//
//  Created by Muhammed Karakul on 29.10.2023.
//

import SwiftUI

struct CreatingPickersInForm: View {
    @State private var checkAmount: Float = .zero
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 20
    
    private let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct CreatingPickersInForm_Previews: PreviewProvider {
    static var previews: some View {
        CreatingPickersInForm()
    }
}
