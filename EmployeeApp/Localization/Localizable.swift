//
//  Localizable.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/11.
//

import Foundation

struct Localizable {
    fileprivate let contents: String
    
    init(_ contents: String) {
        self.contents = contents
    }
}

extension String {
    
    /// Returns a localized string.
    static func localized(_ key: Localizable) -> String {
        return key.contents
    }
}
