//
//  LoginViewModelTests.swift
//  EmployeeAppTests
//
//  Created by ns90840 on 2024/02/12.
//

import Foundation
import XCTest
import Cuckoo
@testable import EmployeeApp

final class LoginViewModelTests: XCTestCase {
    private var serviceUnderTest: LoginViewModel!
    private var mockView: MockLoginView!
    private var mockRepository: MockEmployeeRepository!
    private var container: DIContainer = DIContainer.instance
    
    override func setUp() {
        super.setUp()
        container.reset()
        container = DIContainer.instance
        AsyncProvider.setAsyncRunner(MockAsyncRunner())
        container.register(dependency: EmployeeRepository.self, implementation: { _ in
            return self.mockRepository
        })
        mockView = MockLoginView()
        mockRepository = MockEmployeeRepository()
        serviceUnderTest = LoginViewModel(view: mockView)
        setUpStubs()
    }
    
    override func tearDown() {
        serviceUnderTest = nil
        mockView = nil
        mockRepository = nil
        container.reset()
        AsyncProvider.reset()
        super.tearDown()
    }
    
    func setUpStubs() {
        stub(mockView) { mock in
            mock.showLoadingIndicator().thenDoNothing()
            mock.hideLoadingIndicator().thenDoNothing()
            mock.displayErrorMessage(message: any()).thenDoNothing()
            mock.navigateToEmployeeDetails().thenDoNothing()
        }
    }
    
    func testAuthenticateIsSuccessfulAndTheTokenIsSaved() {
        stub(mockRepository) {  mock in
            mock.login(with: anyString(), password: anyString(), completion: any()).then { (_, _, completion) in
                completion(.success(self.mockAuthenticationResponse))
            }
        }

        serviceUnderTest.authenticateUser(email: "mock-email", password: "mock-password")

        verify(mockView, times(1)).showLoadingIndicator()
        verify(mockRepository, times(1)).login(with: anyString(), password: anyString(), completion: any())
        verify(mockView, times(1)).hideLoadingIndicator()
        verify(mockView, times(1)).navigateToEmployeeDetails()
    }
    
    func testAuthenticateIsSuccessfulButTheTokenIsEmpty() {
        let emptyToken = AuthenticationResponse(token: "")
        stub(mockRepository) {  mock in
            mock.login(with: anyString(), password: anyString(), completion: any()).then { (_, _, completion) in
                completion(.success(emptyToken))
            }
        }

        serviceUnderTest.authenticateUser(email: "mock-email", password: "mock-password")

        verify(mockView, times(1)).showLoadingIndicator()
        verify(mockRepository, times(1)).login(with: anyString(), password: anyString(), completion: any())
        verify(mockView, times(1)).hideLoadingIndicator()
        verify(mockView, times(1)).displayErrorMessage(message: anyString())
    }
    
    func testAuthenticateFailsWithAnError() {
        stub(mockRepository) {  mock in
            mock.login(with: anyString(), password: anyString(), completion: any()).then { (_, _, completion) in
                completion(.failure(.unauthorized))
            }
        }
        
        serviceUnderTest.authenticateUser(email: "mock-email", password: "mock-password")

        verify(mockView, times(1)).showLoadingIndicator()
        verify(mockRepository, times(1)).login(with: anyString(), password: anyString(), completion: any())
        verify(mockView, times(1)).hideLoadingIndicator()
        verify(mockView, times(1)).displayErrorMessage(message: anyString())
    }
    
    func testThatTheEmailEnteredIsValid() {
            XCTAssertTrue(serviceUnderTest.isEmailValid("test@example.com"))
    }
    
    func testThatTheEmailEnteredIsInvalid() {
        XCTAssertFalse(serviceUnderTest.isEmailValid("invalid.email"))
    }
    
    private var mockAuthenticationResponse: AuthenticationResponse {
        return AuthenticationResponse(token: "mock-token-12345")
    }
}
