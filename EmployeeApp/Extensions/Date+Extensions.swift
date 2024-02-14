//
//  Date+Extensions.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/13.
//

import Foundation

extension Date {
    func formatterDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter.string(from: self)
    }
}
