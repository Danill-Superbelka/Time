//
//  AddScreen.swift
//  Time
//
//  Created by Даниил  on 19.11.2024.
//

import SwiftUI

struct AddScreen: View {
    @State private var text: String = ""
    var body: some View {
        Text("Add Screen")
        TextField(text: $text) {
            Text("Test")
        }
        .padding()
    }
}

#Preview {
    AddScreen()
}
