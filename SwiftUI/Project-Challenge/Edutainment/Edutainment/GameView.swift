//
//  GameView.swift
//  Edutainment
//
//  Created by Mete Karakul on 20.07.2024.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        NavigationStack {
            HStack {
                Text("2")
                Text("x")
                Text("5")
                Text("=")
                Text("?")
            }
            .navigationTitle("Game")
            .toolbar {
                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                }
            }
        }
    }
}

#Preview {
    GameView()
}
