//
//  ExampleContentView.swift
//  Word Scramble
//
//  Created by Muhammed Karakul on 24.02.2024.
//

import SwiftUI

struct ExampleContentView: View {
    
    private let people = ["Abbas", "Osman", "Haydar", "Şükriye", "Fadime"]
    
    var body: some View {
        VStack {
            Text("Text from file: \(getTextFromFile())")
            
            ForEach(getLetters(fromSpacedString:"a s d"), id: \.self) {
                Text("\($0)")
            }
            
            ForEach(getLetters(fromRowedString:"q\nw\ne"), id: \.self) {
                Text("\($0)")
            }
            
            Text("\(getRandomElement(from: ["z", "x", "c"]))")
            
            Text("\(getTrimmedString(from: "a b c q\nw\ne"))")
            
            List {
                Section("First Section") {
                    Text("Static row - 1")
                    Text("Static row - 2")
                }
                
                Section("Second Section") {
                    ForEach(1..<4) {
                        Text("Dynamic row \($0)")
                    }
                }
                
                Section("Third Section") {
                    Text("Static row - 3")
                    Text("Static row - 4")
                }
            }
            .listStyle(.grouped)
            
            List(0..<5) {
                Text("Dynamic row - \($0)")
            }
            
            List(people, id: \.self) {
                Text($0)
            }
            
            List {
                Text("Static row")
                ForEach(people, id: \.self) {
                    Text($0)
                }
                Text("Static row")
            }
        }
    }
    
    private func getTextFromFile() -> String {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            guard let fileContents = try? String(contentsOf: fileURL) else {
                return "Content not found."
            }
            return fileContents
        }
        return "File not found."
    }
    
    private func getLetters(fromSpacedString string: String) -> [String] {
        let letters = string.components(separatedBy: " ")
        return letters
    }
    
    private func getLetters(fromRowedString string: String) -> [String] {
        let letters = string.components(separatedBy: "\n")
        return letters
    }
    
    private func getRandomElement(from letters: [String]) -> String {
        return letters.randomElement() ?? "-"
    }
    
    private func getTrimmedString(from string: String) -> String {
        return string.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    private func getCheckedText() {
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
    }
}

#Preview {
    ExampleContentView()
}
