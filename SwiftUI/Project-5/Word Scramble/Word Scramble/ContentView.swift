//
//  ContentView.swift
//  Word Scramble
//
//  Created by Muhammed Karakul on 24.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWord = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWord, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(alertTitle, isPresented: $showingAlert) { } message: {
                Text(alertMessage)
            }
         }
    }
    
    private func startGame() {
        guard let url = Bundle.main.url(forResource: "start", withExtension: "txt"),
              let content = try? String(contentsOf: url) else {
            fatalError("Could not load start.txt from bundle.")
        }
        let words = content.components(separatedBy: "\n")
        rootWord = words.randomElement() ?? "silkworm"
    }
    
    private func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isOrginal(word: answer) else {
            wordErrorAlert(withTitle: "Word used already", andMessage: "Be more orginal")
            return
        }
        
        guard isPossible(word: answer) else {
            wordErrorAlert(withTitle: "Word not posible", andMessage: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordErrorAlert(withTitle: "Word not recognized", andMessage: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWord.insert(answer, at: .zero)
        }
        newWord = ""
    }
    
    private func isOrginal(word: String) -> Bool {
        !usedWord.contains(word)
    }
    
    private func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        
        return true
    }
    
    private func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: .zero, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: .zero, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    private func wordErrorAlert(withTitle title: String, andMessage message: String) {
        alertTitle = title
        alertMessage = message
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
