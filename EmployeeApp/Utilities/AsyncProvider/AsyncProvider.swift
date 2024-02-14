//
//  AsyncProvider.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

struct AsyncProvider {

    private static var asyncRunner : AsyncRunner = AsyncRunnerImplementation()

    public static func runOnConcurrent(_ action: @escaping () -> Void) {
        asyncRunner.runOnConcurrent(action)
    }
    
    public static func runOnMain(_ action: @escaping () -> Void) {
        asyncRunner.runOnMain(action)
    }

    public static func setAsyncRunner(_ asyncRunner: AsyncRunner) {
        self.asyncRunner = asyncRunner
    }
    
    public static func reset() {
        asyncRunner = AsyncRunnerImplementation()
    }
}
