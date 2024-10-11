//
//  TimeEntryInterval.swift
//  Time
//
//  Created by Даниил  on 11.10.2024.
//

import Foundation
import SwiftData

@Model
final class TimeEntryInterval {
    @Attribute(.unique) var id: UUID
    var startTime: Date
    var endTime: Date?

    init(startTime: Date, endTime: Date? = nil) {
        id = UUID()
        self.startTime = startTime
        self.endTime = endTime
    }

    var elapsedTime: TimeInterval {
        guard let endTime = endTime else { return 0 }
        return endTime.timeIntervalSince(startTime)
    }
}
