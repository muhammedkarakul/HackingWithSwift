//
//  CreatingForm.swift
//  Basics
//
//  Created by Muhammed Karakul on 29.10.2023.
//

import SwiftUI

struct CreatingForm: View {
    var body: some View {
        Form {
            Section {
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
            }
            Section {
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
            }
            Section {
                Text("Hello, world!")
                Text("Hello, world!")
            }
        }
    }
}

struct CreatingForm_Preview: PreviewProvider {
    static var previews: some View {
        CreatingForm()
    }
}
