//
//  ContentView.swift
//  WeSplit
//
//  Created by Mete Karakul on 22.10.2023.
//

import SwiftUI

struct PercentageStyle: ViewModifier {
    private let shouldApplyForeground: Bool
    
    func body(content: Content) -> some View {
        if shouldApplyForeground {
            content
                .foregroundStyle(.red)
        } else {
            content
        }
    }
    
    init(shouldApplyForeground: Bool) {
        self.shouldApplyForeground = shouldApplyForeground
    }
}

extension Text {
    
    func percentageStyle(for number: Int) -> some View {
        modifier(PercentageStyle(shouldApplyForeground: number == .zero))
    }
}

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    private var currencyCode: String { Locale.current.currency?.identifier ?? "USD" }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount",
                              value: $checkAmount,
                              format: .currency(code: currencyCode))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: currencyCode))
                        .percentageStyle(for: tipPercentage)
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
