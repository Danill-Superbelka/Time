//
//  GlobalTimer.swift
//  Time
//
//  Created by Даниил  on 11.10.2024.
//

import Foundation
import SwiftData

@Model
final class GlobalTimer {
    @Attribute(.unique) var id: UUID
    var totalTime: TimeInterval
    var isRunning: Bool
    var activeTimers: [TimeEntry]
    var lastUpdate: Date?

    init(
        id: UUID = UUID(),
        totalTime: TimeInterval = 0,
        isRunning: Bool = false,
        activeTimers: [TimeEntry] = [],
        lastUpdate: Date? = nil
    ) {
        self.id = id
        self.totalTime = totalTime
        self.isRunning = isRunning
        self.activeTimers = activeTimers
        self.lastUpdate = lastUpdate
    }

    func start() {
        guard !isRunning else { return }
        isRunning = true
        lastUpdate = Date()
    }

    func stop() {
        guard isRunning else { return }
        updateTotalTime()
        isRunning = false
        lastUpdate = nil
    }

    func updateTotalTime() {
        guard let lastUpdate = lastUpdate else { return }
        let currentTime = Date()
        totalTime += currentTime.timeIntervalSince(lastUpdate)
        self.lastUpdate = currentTime
    }

    func updateActiveTimers(_ timers: [TimeEntry]) {
        activeTimers = timers.filter { $0.isActive }

        if activeTimers.isEmpty {
            stop() // Остановить общий таймер, если нет активных секундомеров
        } else if !isRunning {
            start() // Запустить общий таймер, если появился активный секундомер
        }
    }

    func reset() {
        totalTime = 0
        isRunning = false
    }
}
