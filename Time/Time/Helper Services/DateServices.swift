//
//  DateServices.swift
//  Time
//
//  Created by Даниил  on 22.10.2024.
//

import Foundation

enum DateFormat {
    case dayMonthShort
    case dayMonthLong
}

extension Date {
    
    func getDateWithFormat(_ format: DateFormat) -> String {
        
        switch format {
        case .dayMonthShort:
           return self.formatted(.dateTime.weekday(.abbreviated).day(.twoDigits).month(.abbreviated).locale(Locale.current))
        case .dayMonthLong:
            return self.formatted(.dateTime.day(.twoDigits).month(.wide).locale(Locale.current))
        }
    }
}
