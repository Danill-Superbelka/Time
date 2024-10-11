//
//  MainTabBarView.swift
//  Time
//
//  Created by Даниил  on 18.11.2024.
//

import SwiftUI

struct MainTabBarView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var activeTab: Tab = .home
    @State private var isAddScreenPresented: Bool = false
    
    @Namespace private var animation
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                HomeScreen(selectedTab: $activeTab)
                    .tag(Tab.home)
                    .toolbar(.hidden, for: .tabBar)
                CalendarView()
                    .tag(Tab.calendar)
                    .toolbar(.hidden, for: .tabBar)
                Text("Xmm")
                    .tag(Tab.add)
                    .toolbar(.hidden, for: .tabBar)
                StatsScreen()
                    .tag(Tab.stats)
                    .toolbar(.hidden, for: .tabBar)
                SettingsScreen()
                    .tag(Tab.settings)
                    .toolbar(.hidden, for: .tabBar)
            }
          
            CustomTabBar()
        }
        .sheet(isPresented: $isAddScreenPresented) {
            AddScreen()
                .presentationDetents([.medium])
                .presentationCornerRadius(35)
        }
        .onChange(of: activeTab, { oldValue, newValue in
            if newValue == .add {
                isAddScreenPresented = true
                activeTab = oldValue
            }
        })
    }
    
    @ViewBuilder
    func CustomTabBar(_ tint: Color = Color.blue, _ inactiveColor: Color = Color.black) -> some View {
        HStack(alignment: .bottom, spacing: 5) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(
                    tint: tint,
                    inactiveColor: inactiveColor,
                    tab: $0,
                    animation: animation,
                    activeTab: $activeTab
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(content: {
            TabShape(midpoint: UIScreen.main.bounds.width / 2)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        })
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}

struct TabItem: View {
    var tint: Color
    var inactiveColor: Color
    var tab: Tab
    var animation: Namespace.ID
    
    @Binding var activeTab: Tab

    var body: some View {
        VStack {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .frame(width: tab == .add ? 55 : 35, height: tab == .add ? 55 : 35)
                .foregroundStyle(
                    tab == .add ?
                    (.white) :
                        (tab == activeTab ? tint : inactiveColor)
                )
                .background {
                    if tab == .add {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            activeTab = tab
        }
    }
}

#Preview {
    MainTabBarView()
        .modelContainer(for: TimeEntry.self, inMemory: true)
}
