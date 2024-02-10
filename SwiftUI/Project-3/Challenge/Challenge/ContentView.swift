//
//  ContentView.swift
//  Challenge
//
//  Created by Muhammed Karakul on 10.02.2024.
//

import SwiftUI

struct ContentView: View {
    private let moves = ["rock", "paper", "scissors"]
    private var shuffledMoves: [String] {
        return moves.shuffled()
    }
    
    @State private var score = 0
    @State private var endTurnMessage = "Turn is over"
    @State private var selectedMove = "rock"
    @State private var isTurnOver: Bool = false
    
    var body: some View {
        VStack {
            ForEach(moves, id: \.self) { move in
                Button {
                    if move == selectedMove {
                        score += 1
                        endTurnMessage = "Win - Current Score: \(score)"
                    } else {
                        score -= 1
                        endTurnMessage = "Lose - Current Score: \(score)"
                    }
                    isTurnOver = true
                } label: {
                    Image(move)
                }
            }
        }
        .padding()
        .alert(endTurnMessage, isPresented: $isTurnOver) {
            Button("OK", role: .cancel) {
                self.selectedMove = shuffledMoves[.zero]
            }
        }
    }
}

#Preview {
    ContentView()
}
