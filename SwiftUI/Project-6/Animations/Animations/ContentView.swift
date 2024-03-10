//
//  ContentView.swift
//  Animations
//
//  Created by Muhammed Karakul on 25.02.2024.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    
//    @State private var animationAmount = 1.0
//    @State private var animationAmount = 0.0
//    @State private var enabled = false
//    @State private var dragAmount: CGSize = .zero
//    private let letters = Array("Hello, SwiftUI!")
//    @State private var enabled = false
    @State private var isShowingRed = false
    
    var body: some View {
        
//        print(animationAmount)
        
//        return VStack {
            
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
            
//            Button("Tap Me") {
//                withAnimation {
//                    animationAmount += 360
//                }
//                withAnimation(.spring(duration: 1, bounce: 0.5)) {
//                    animationAmount += 360
//                }
//            }
//            .padding(50)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0.0, y: 0.0, z: 1.0))
//        }
//        .padding()
            
        /** Day 33(Project 6 Part 2) - Controlling the animation stack  */
//        Button("Tap Me") {
//            enabled.toggle()
//        }
//        .frame(width: 200, height: 200) // Modifier order is matter!
//        .background(enabled ? .blue : .red)
//        .animation(.default, value: enabled)  // .animation modifier effect abow lines!
//        .animation(nil, value: enabled) // nil disables animation
//        .frame(width: 200, height: 200)
//        .foregroundStyle(.white)
//        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
//        .animation(.spring(duration: 1, bounce: 0.6), value: enabled) // Each animation modifier effect abow lines up to another animation modifier
//        .animation(.default, value: enabled)
//        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        
        /** Day 33(Project 6 Part 2) - Animating gestures */
//        LinearGradient(colors: [.red, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(.rect(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged { dragAmount = $0.translation }
//                    .onEnded { _ in
//                        withAnimation(.bouncy) {
//                            dragAmount = .zero
//                        }
//                    }
//            )
//            .animation(.bouncy, value: dragAmount)
        
//        HStack {
//            ForEach(0..<letters.count, id: \.self) { index in
//                Text(String(letters[index]))
//                    .padding(3)
//                    .font(.title)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(.linear.delay(Double(index) / 20), value: dragAmount)
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { dragAmount = $0.translation }
//                .onEnded { _ in
//                    dragAmount = .zero
//                    enabled.toggle()
//                }
//        )
        
        /** Day 33(Project 6 Part 2) - Showing and hiding views with transitions */
        
//        Button("Tap Me") {
//            withAnimation {
//                isShowingRed.toggle()
//            }
//        }
//        if isShowingRed {
//            Rectangle()
//                .fill(.red)
//                .frame(width: 200, height: 200)
//                .transition(.asymmetric(insertion: .scale, removal: .opacity))
//                // .transition(.scale)
//        }
        
        /** Day 33(Project 6 Part 2) - Building custom transitions using ViewModifier */
        ZStack {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
