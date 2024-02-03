//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Mete Karakul on 3.02.2024.
//

import SwiftUI

struct CapsuleText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct Title: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
    
}

extension View {
    
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    
    @State private var isTextRed: Bool = false
    
    var motto1: some View { Text("Ne olursan ol yine gel") }
    let motto2 = Text("Sevmek sevmekse, sevmememek sevmemektir")
    
    @ViewBuilder var spells: some View {
        Text("Kul euzu billah")
        Text("Etteyatü")
    }
    
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, World!")
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.red)
        
//        Button("Hello, Mars!") {
//            print(type(of: self.body))
//        }
//        .frame(width: 200, height: 200)
//        .background(.red)
        
//        Text("Hello, Bayburt!")
//            .padding()
//            .background(.red)
//            .padding()
//            .background(.green)
//            .padding()
//            .background(.blue)
//            .padding()
//            .background(.yellow)
        
//        Button("Tap Me!") {
//            isTextRed.toggle()
//        }
//        .foregroundColor(isTextRed ? .red : .blue)
        
        // font() is an environment modifier
//        VStack {
//            Text("Fenerbahçe")
//                .font(.largeTitle)
//            Text("Galatasaray")
//            Text("Beşiktaş")
//            Text("Trabzon")
//        }
//        .font(.title)
        
        // blur() is NOT an environment modifier
//        VStack {
//            Text("Fenerbahçe")
//                .blur(radius: 0.0)
//            Text("Galatasaray")
//            Text("Beşiktaş")
//            Text("Trabzon")
//        }
//        .blur(radius: 5.0)
        
//        VStack {
//            motto1
//                .foregroundStyle(.red)
//            motto2
//                .foregroundStyle(.blue)
//            spells
//        }
        
//        VStack(spacing: 10) {
//            
//            CapsuleText(text: "First")
//                .foregroundStyle(.white)
//            
//            CapsuleText(text: "Second")
//                .foregroundStyle(.yellow)
//            
//            Text("Third")
//                .font(.largeTitle)
//                .padding()
//                .foregroundStyle(.white)
//                .background(.blue)
//                .clipShape(.capsule)
//        }
        
        Text("Hello, World!")
            .modifier(Title())
        
        Text("Hello, World!")
            .titleStyle()
        
        Color.blue
            .frame(width: 200, height: 200)
            .watermarked(with: "Swiftologist")
    }
}

#Preview {
    ContentView()
}
