//
//  AsyncRunner.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

protocol AsyncRunner {
    func runOnConcurrent(_ action: @escaping () -> Void)
    func runOnMain(_ action: @escaping () -> Void)
}

class AsyncRunnerImplementation: NSObject, AsyncRunner {
    public func runOnConcurrent(_ action: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async(execute: action)
    }
    
    public func runOnMain(_ action: @escaping () -> Void) {
        DispatchQueue.main.async(execute: action)
    }
}
