//
//  UpdateEmployee.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/11.
//

import Foundation
struct UpdateEmployeeRequest: Codable {
    var userLoginToken: String
    var personalDetails: PersonalDetails
    var additionalInformation: AdditionalInformation
}

struct UpdateEmployeeResponse: Codable {
    let id: String
    let createdAt: String
    let userLoginToken: String
    let personalDetails: PersonalDetails
    let additionalInformation: AdditionalInformation
}

struct PersonalDetails: Codable {
    var id: String
    var email: String
    var firstName: String
    var lastName: String
    var avatar: String
    var dob: String
    var gender: String
    
    enum CodingKeys: String, CodingKey {
        case id, email, firstName = "first_name", lastName = "last_name", avatar, dob = "DOB", gender
    }
}

struct AdditionalInformation: Codable {
    var placeOfBirth: String
    var preferredColor: String
    var residentialAddress: String
    
    enum CodingKeys: String, CodingKey {
        case placeOfBirth, preferredColor, residentialAddress
    }
}
