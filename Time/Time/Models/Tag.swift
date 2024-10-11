//
//  Tag.swift
//  Time
//
//  Created by Даниил  on 11.10.2024.
//

import Foundation
import SwiftData

@Model
final class Tag {
    @Attribute(.unique) var id: UUID // Уникальный идентификатор тега
    var name: String // Название тега (например, "Работа", "Дом")
    var colorHex: String // Цвет тега в формате HEX (для визуализации)

    init(name: String, colorHex: String = "#000000") {
        id = UUID()
        self.name = name
        self.colorHex = colorHex
    }
}
