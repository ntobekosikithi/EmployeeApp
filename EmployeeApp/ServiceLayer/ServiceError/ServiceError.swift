//
//  ServiceError.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

enum ServiceError: Error {
    case wrongRequest
    case parsingError
    case unauthorized
    case notResults
    case serverError(code: Int)
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .wrongRequest: return "Invalid request. Please try again later"
        case .parsingError: return "Invalid response. Please try again later"
        case .unauthorized: return "Authentication failed. Incorrect email or password"
        case .notResults: return "No results received from the servcie."
        case .serverError(let code): return "Something went wrong. Response code: \(code)"
        case .unknown: return "An unknown error occured. Please try again later."
        }
    }
}
