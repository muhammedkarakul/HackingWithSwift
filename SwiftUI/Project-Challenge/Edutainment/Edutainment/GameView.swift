//
//  GameView.swift
//  Edutainment
//
//  Created by Mete Karakul on 20.07.2024.
//

import SwiftUI

struct GameView: View {
    
    @State var questionNumber: Int = 0
    @State var settingsView = SettingsView()
    private var questions: [Question] = []
    
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
                Button("Play", action: startGame)
                NavigationLink(destination: settingsView) {
                    Text("Settings")
                }
            }
        }
    }
    
    func startGame() {
        print(settingsView.$numberOfQuestions)
        print(settingsView.$multiplicationNumber)
    }
}

#Preview {
    GameView()
}
