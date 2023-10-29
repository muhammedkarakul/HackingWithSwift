//
//  AddingNavigationBar.swift
//  Basics
//
//  Created by Muhammed Karakul on 29.10.2023.
//

import SwiftUI

struct AddingNavigationBar: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello, world!")
                }
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddingNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        AddingNavigationBar()
    }
}
