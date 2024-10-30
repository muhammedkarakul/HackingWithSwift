//
//  ContentView.swift
//  iExpense
//
//  Created by Mete Karakul on 13.10.2024.
//

import SwiftUI
import Observation

@Observable
class User {
    var firstName: String = "Bilbo"
    var lastName: String = "Baggins"
}

struct ContentView: View {
    @State var user: User = .init()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
