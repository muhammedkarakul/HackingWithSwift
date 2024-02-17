//
//  ContentView.swift
//  BetterRest
//
//  Created by Mete Karakul on 17.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
