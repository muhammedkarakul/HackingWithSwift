//
//  ContentView.swift
//  WeSplit
//
//  Created by Mete Karakul on 22.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
                Section {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
                Section {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
