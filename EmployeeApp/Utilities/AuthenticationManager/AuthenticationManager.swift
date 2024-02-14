//
//  AuthenticationManager.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

protocol AuthenticationManagerProtocol: AnyObject {
    func saveToken(accessToken: String) -> OSStatus
    func getUserToken() -> String
    func deleteUserToken()
}

class AuthenticationManager: AuthenticationManagerProtocol {
    
    static let shared = AuthenticationManager()
    private let service: String = "access-token"
    private let account: String = "EmployeeApp"
    private init() {}
    
    func saveToken(accessToken: String) -> OSStatus {
        let data = Data(accessToken.utf8)
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
        ] as CFDictionary

        let status = SecItemAdd(query, nil)
        return  status == errSecDuplicateItem ? update(data: data) : status
    }
    
    func getUserToken() -> String {
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query, &result)
        guard status == errSecSuccess, let data = result as? Data else { return "" }
        guard let token =  String(data: data, encoding: .utf8) else { return ""}
        return token
    }
    
    func deleteUserToken() {
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
            ] as CFDictionary

        SecItemDelete(query)
    }
    
    private func update(data: Data) -> OSStatus {
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
        ] as CFDictionary

        let attributesToUpdate = [kSecValueData: data] as CFDictionary
        return SecItemUpdate(query, attributesToUpdate)
    }
}
