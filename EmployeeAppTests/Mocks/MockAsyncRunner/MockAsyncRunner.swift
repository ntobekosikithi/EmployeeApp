//
//  MockAsyncRunner.swift
//  EmployeeAppTests
//
//  Created by ns90840 on 2024/02/12.
//

import Foundation
@testable import EmployeeApp

struct MockAsyncRunner: AsyncRunner {

    let beforeRunInBackground: (() -> Void)?
    let beforeRunOnMain: (() -> Void)?

    public init() {
        self.beforeRunInBackground = .none
        self.beforeRunOnMain = .none
    }

    public init(beforeRunInBackground: @escaping () -> Void) {
        self.beforeRunInBackground = beforeRunInBackground
        self.beforeRunOnMain = .none
    }

    public init(beforeRunOnMain: @escaping () -> Void) {
        self.beforeRunInBackground = .none
        self.beforeRunOnMain = beforeRunOnMain
    }

    public init(beforeRunInBackground: @escaping () -> Void, beforeRunOnMain: @escaping () -> Void) {
        self.beforeRunInBackground = beforeRunInBackground
        self.beforeRunOnMain = beforeRunOnMain
    }

    public func runOnConcurrent(_ action: @escaping () -> Void) {
        beforeRunInBackground?()
        action()
    }

    public func runOnMain(_ action: @escaping () -> Void) {
        beforeRunOnMain?()
        action()
    }

}
