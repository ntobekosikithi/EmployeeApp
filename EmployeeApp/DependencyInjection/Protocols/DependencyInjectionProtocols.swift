//
//  DependencyInjectionProtocols.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation
import Swinject

protocol Register {
    func register<T>(dependency: T.Type,
                     implementation: @escaping (_ resolver: Resolve) -> T,
                     objectScope: ObjectScope)
}

protocol Resolve {
    func resolve<T>(_ dependency: T.Type) -> T
    func reset()
}

protocol Resolving {
    static func resolve<T>(dependency: T.Type) -> T
    static func reset()
}

