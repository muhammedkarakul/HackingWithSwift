//
//  ContentView.swift
//  Basics
//
//  Created by Muhammed Karakul on 29.10.2023.
//

import SwiftUI

struct CreatingViewsInLoop: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        
        NavigationStack {
            Form {
                ForEach(0..<100) { // in number
                    // Text("Row \(number)")
                    Text("Row \($0)")
                }
            }
            
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

struct CreatingViewsInLoop_Previews: PreviewProvider {
    static var previews: some View {
        CreatingViewsInLoop()
    }
}
