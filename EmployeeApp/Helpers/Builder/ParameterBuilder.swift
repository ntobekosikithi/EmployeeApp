//
//  ParameterBuilder.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

struct ParameterBuilder {
    private var parameters: [String: Any] = [:]

    mutating func addParameter(_ key: String, value: Any) {
        parameters[key] = value
    }
    
    func build() -> Data? {
        return try? JSONSerialization.data(withJSONObject: parameters)
    }
}
