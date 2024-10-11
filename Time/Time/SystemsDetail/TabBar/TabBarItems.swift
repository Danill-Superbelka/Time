//
//  TabBarItems.swift
//  Time
//
//  Created by Даниил  on 18.11.2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "Home"
    case calendar = "Calendar"
    case add = "Add"
    case stats = "Statistic"
    case settings = "Settings"
    
    var systemImage: String {
        switch self {
        case .home:
            "house"
        case .calendar:
            "calendar"
        case .stats:
            "list.bullet.clipboard"
        case .settings:
            "gear"
        case .add:
            "plus"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
