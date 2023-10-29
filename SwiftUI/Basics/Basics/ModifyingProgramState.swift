//
//  ModifyingProgramState.swift
//  Basics
//
//  Created by Muhammed Karakul on 29.10.2023.
//

import SwiftUI

struct ModifyingProgramState: View {
    @State private var tapCount: Int = .zero
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct ModifyingProgramState_Previews: PreviewProvider {
    static var previews: some View {
        ModifyingProgramState()
    }
}
