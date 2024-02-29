//
//  ContentView.swift
//  Animations
//
//  Created by Muhammed Karakul on 25.02.2024.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var animationAmount = 1.0
    @State private var animationAmount = 0.0
    
    var body: some View {
        
        print(animationAmount)
        
        return VStack {
            
//            Stepper("Scale amount", value: $animationAmount.animation(
//                .easeInOut(duration: 1)
//                .repeatCount(3, autoreverses: true)
//            ), in: 1...10)
//            
//            Spacer()
//            
//            Button("Tap Me") {
//                animationAmount += 1
//            }
//            .padding(50)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            .scaleEffect(animationAmount)
////            .animation(.default, value: animationAmount)
////            .animation(.linear, value: animationAmount)
////            .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
//            .animation(
//                .easeInOut(duration: 2)
////                .delay(1),
////                    .repeatCount(3, autoreverses: true),
//                    .repeatForever(autoreverses: true),
//                value: animationAmount)
////            .blur(radius: (animationAmount - 1) * 3)
//            .overlay(
//                Circle()
//                    .stroke(.red)
//                    .scaleEffect(animationAmount)
//                    .opacity(2 - animationAmount)
//                    .animation(
//                        .easeOut(duration: 1)
//                            .repeatForever(autoreverses: false),
//                        value: animationAmount
//                    )
//            )
//            .onAppear {
//                animationAmount = 2
//            }
//            
//            Spacer()
            
            Button("Tap Me") {
//                withAnimation {
//                    animationAmount += 360
//                }
                withAnimation(.spring(duration: 1, bounce: 0.5)) {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0.0, y: 0.0, z: 1.0))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
