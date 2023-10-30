//
//  ReadingTextFromTextField.swift
//  Basics
//
//  Created by Muhammed Karakul on 30.10.2023.
//

import SwiftUI

struct ReadingTextFromTextField: View {
    @State private var checkAmount: Double = .zero
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 20
    
    private var currencyCode: String {
        Locale.current.currency?.identifier ?? "USD"
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Amount",
                          value: $checkAmount,
                          format: .currency(code: currencyCode))
                    .keyboardType(.decimalPad)
            }
            Section {
                Text(checkAmount,
                     format: .currency(code: currencyCode))
            }
        }
    }
}

struct ReadingTextFromTextField_Previews: PreviewProvider {
    static var previews: some View {
        ReadingTextFromTextField()
    }
}
