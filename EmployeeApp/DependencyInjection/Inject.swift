//
//  Inject.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

@propertyWrapper public struct Inject<T> {
    public var wrappedValue: T {
        return instance
    }

    private var instance: T
    public init() {
        instance = ResolverFactory.resolve(dependency: T.self)
    }
}
