//
//  TabPosition.swift
//  Time
//
//  Created by Даниил  on 18.11.2024.
//

import SwiftUI

struct Positionkey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    
    @ViewBuilder
    func viewPosition(completion: @escaping (CGRect)-> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let rect = $0.frame(in: .global)
                    
                    Color.clear
                        .preference(key: Positionkey.self, value: rect)
                        .onPreferenceChange(Positionkey.self, perform: completion)
                }
            }
    }
}
