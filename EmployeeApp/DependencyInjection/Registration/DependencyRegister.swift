//
//  DependencyRegister.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

func registerAllDependencies() {
    let container = DIContainer.instance
    container.register(dependency: ServiceLayer.self, implementation: { _ in
        ServiceLayerImplementation()
    }, objectScope: .weak)

    container.register(dependency: EmployeeRepository.self, implementation: { _ in
        return EmployeeRepositoryImplementation()
    }, objectScope: .weak)
}
