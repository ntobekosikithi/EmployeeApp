//
//  EmployeesDatailsResponse.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

struct EmployeesDatailsResponse: Codable {
    let page, perPage, total, totalPages: Int
    var employees: [Employee]
    let support: Support
    enum CodingKeys: String, CodingKey {
        case page, total
        case perPage = "per_page"
        case totalPages = "total_pages"
        case employees = "data"
        case support
    }
}

struct Support: Codable {
    let url: String
    let text: String
}

struct Employee: Codable {
    let id: Int
    let email, firstName, lastName, avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
    
    func fullName() -> String {
        "\(firstName) \(lastName)"
    }
}
