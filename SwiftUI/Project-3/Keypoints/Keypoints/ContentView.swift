//
//  ContentView.swift
//  Keypoints
//
//  Created by Muhammed Karakul on 10.02.2024.
//

import SwiftUI

struct ContentView: View {
    
//    private let agents = ["Cyril", "Lane", "Pam", "Sterling"]
    
//    @State private var selection = 0 {
//        didSet {
//            print(selection)
//        }
//    }
    
    @State private var agreedToTerms = false
    @State private var agreedToPrivacyPolicy = false
    @State private var agreedToEmails = false
    
    var body: some View {
        
        //        ForEach(0 ..< 100) { number in
        //            Text("Row \(number)")
        //        }
        
        //        VStack {
        //            ForEach(0..<agents.count) { number in
        //                Text(agents[number])
        //            }
        //        }
        
        //        VStack {
        //            ForEach(agents, id: \.self) {
        //                Text($0)
        //            }
        //        }
        
        //        let binding = Binding(get: { selection },
        //                              set: { selection = $0 })
        //        return VStack {
        //            Picker("Select a number", selection: binding) {
        //                ForEach(0..<3) {
        //                    Text("Item \($0)")
        //                }
        //            }
        //            .pickerStyle(.segmented)
        //        }
        
        let agreedToAll = Binding<Bool> (
            get: {
                agreedToTerms && agreedToPrivacyPolicy && agreedToEmails
            },
            set: {
                agreedToTerms = $0
                agreedToPrivacyPolicy = $0
                agreedToEmails = $0
            }
        )
        
        return VStack {
            Toggle("Agree to terms", isOn: $agreedToTerms)
            Toggle("Agree to terms", isOn: $agreedToPrivacyPolicy)
            Toggle("Agree to terms", isOn: $agreedToEmails)
            Toggle("Agree to all", isOn: agreedToAll)
        }
    }
}

#Preview {
    ContentView()
}
