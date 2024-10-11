//
//  CalendarView.swift
//  Time
//
//  Created by Даниил  on 18.11.2024.
//

import SwiftUI

struct CalendarView: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationStack {
            Text("Календарь")
                .navigationTitle("Календарь")
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.left.arrow.right")
                                .tint(.black)
                        }

                    }
                })
        }
    }
}

#Preview {
    CalendarView()
}
