//
//  ColorsDetailsRepsonse.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation
struct ColorsDetailsRepsonse: Codable {
    let page, perPage, total, totalPages: Int
    var colors: [Color]
    enum CodingKeys: String, CodingKey {
        case page, total
        case perPage = "per_page"
        case totalPages = "total_pages"
        case colors = "data"
    }
}

struct Color: Codable {
    let id, year: Int
    let name, color, pantoneValue: String

    enum CodingKeys: String, CodingKey {
        case id, year, name, color
        case pantoneValue = "pantone_value"
    }
}
