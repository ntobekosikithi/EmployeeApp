//
//  ResolverFactory.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation
import Swinject

class ResolverFactory {
    private static var container: Resolve = DIContainer.instance
}

extension ResolverFactory: Resolving {
    static func resolve<T>(dependency: T.Type) -> T {
        return container.resolve(dependency)
    }
    static func reset() {
        container.reset()
    }
}
