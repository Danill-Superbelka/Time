//
//  TimeEntry.swift
//  Time
//
//  Created by Даниил  on 11.10.2024.
//

import Foundation
import SwiftData

@Model
final class TimeEntry {
    @Attribute(.unique) var id: UUID
    var title: String
    var tags: [Tag]
    var hourlyRate: Double
    var intervals: [TimeEntryInterval]
    var isActive: Bool

    init(title: String, tags: [Tag], hourlyRate: Double) {
        id = UUID()
        self.title = title
        self.tags = tags
        self.hourlyRate = hourlyRate
        isActive = false
        intervals = []
    }

    func start() {
        guard !isActive else { return }
        let newInterval = TimeEntryInterval(startTime: Date())
        intervals.append(newInterval)
        isActive = true
    }

    func stop() {
        guard isActive else { return }
        if var currentInterval = intervals.last {
            currentInterval.endTime = Date()
        }
        isActive = false
    }

    var totalElapsedTime: TimeInterval {
        return intervals.reduce(0) { $0 + $1.elapsedTime }
    }

    var earnedAmount: Double {
        return totalElapsedTime / 3600 * hourlyRate
    }
}
