//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Mete Karakul on 21.01.2024.
//

import SwiftUI

struct FlagImage: View {
    private let name: String
    
    var body: some View {
        Image(name)
    }
    
    init(name: String) {
        self.name = name
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var isGameOver = false
    @State private var scoreTitle = ""
    @State private var gameOverTitle = ""
    @State private var score = 0
    @State private var currentQuestionNumber = 1
    private let numberOfQuestions = 3
    
    @State private var rotationAmount: CGFloat = .zero
    @State private var isFlagSelected = false
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack() {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                }
                
                ForEach(0..<3) { number in
                    Button {
                        withAnimation {
                            flagTapped(number)
                        }
                    } label: {
                        FlagImage(name: countries[number])
                    }
                    .rotation3DEffect(
                        .degrees(number == correctAnswer ? rotationAmount : .zero),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .opacity(isFlagSelected ? (number == correctAnswer ? 1.0 : 0.75) : 1.0)
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestionIfGameNotOvered)
        } message: {
            Text("Your score is \(score)")
        }
        .alert(gameOverTitle, isPresented: $isGameOver) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 10
            rotationAmount += 360
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score -= 5
        }
        
        showingScore = true
        isFlagSelected = true
    }
    
    func askQuestionIfGameNotOvered() {
        if currentQuestionNumber == numberOfQuestions {
            if score > .zero {
                gameOverTitle = "Congrats, You Win! 🥳"
            } else {
                gameOverTitle = "Sorry, You Lose. 😔"
            }
            isGameOver = true
        } else {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            currentQuestionNumber += 1
            isFlagSelected = false
        }
    }
    
    func restartGame() {
        currentQuestionNumber = .zero
        score = .zero
        askQuestionIfGameNotOvered()
    }
}

#Preview {
    ContentView()
}
