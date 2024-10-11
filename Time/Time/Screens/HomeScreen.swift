//
//  HomeScreen.swift
//  Time
//
//  Created by Даниил  on 11.10.2024.
//
//

import SwiftData
import SwiftUI

struct HomeScreen: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [TimeEntry]
    @State private var currentDate = Date()
    @Binding var selectedTab: Tab
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("Home Screen")
            }
            .navigationTitle(currentDate.getDateWithFormat(.dayMonthLong))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        selectedTab = .calendar
                    }, label: {
                        Image(systemName: "calendar")
                            .tint(.black)
                    })
                }
            }
        }
    }
    
}

#Preview {
    HomeScreen(selectedTab: .constant(.home))
        .modelContainer(for: TimeEntry.self, inMemory: true)
}
