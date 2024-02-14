//
//  ModelToJSONDataHelper.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/11.
//

import Foundation

class ModelToJSONDataHelper {
    static func convert<T: Encodable>(_ model: T) -> Data? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let jsonData = try encoder.encode(model)
            return jsonData
        } catch {
            return nil
        }
    }
}

