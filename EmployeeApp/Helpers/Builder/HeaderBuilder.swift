//
//  HeaderBuilder.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

struct HeaderBuilder {
    private var headers: [String: String] = [:]

    mutating func addHeader(_ key: String, value: String) {
        headers[key] = value
    }

    func build() -> [String: String] {
        return headers
    }
}
