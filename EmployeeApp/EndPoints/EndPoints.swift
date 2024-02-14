//
//  EndPoints.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

struct EndPoints {
    
    private static let baseUrl = "https://reqres.in/api"
    private static let login = "/login"
    private static let users = "/users"
    private static let colors = "/unknown?"

    static func loginEndPoint() -> String {
        return baseUrl + login
    }
    
    static func usersEndPoint() -> String {
        return baseUrl + users
    }

    static func usersEndPoint(page: String, perPage: String) -> String {
        return baseUrl + users + ("?page=\(page)&per_page=\(perPage)")
    }

    static func colorsEndPoint(perPage: String) -> String {
        return baseUrl + colors + ("?per_page=\(perPage)")
    }
}
