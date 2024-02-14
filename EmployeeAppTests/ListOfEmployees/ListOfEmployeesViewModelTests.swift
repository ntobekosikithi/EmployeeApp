//
//  ListOfEmployeesViewModelTests.swift
//  EmployeeAppTests
//
//  Created by ns90840 on 2024/02/12.
//

import Foundation
import XCTest
import Cuckoo
@testable import EmployeeApp

final class ListOfEmployeesViewModelTests: XCTestCase {
    private var serviceUnderTest: ListOfEmployeesViewModel!
    private var mockView: MockListOfEmployeesView!
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
        mockView = MockListOfEmployeesView()
        mockRepository = MockEmployeeRepository()
        serviceUnderTest = ListOfEmployeesViewModel(view: mockView)
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
            mock.displayEmployees(employees: any()).thenDoNothing()
            mock.displayEmptyView().thenDoNothing()
        }
    }
    
    func testThatGetListOfMployeeIsSuccessfulAndEmployeesGetDisplayed() {
        stub(mockRepository) {  mock in
            mock.getListOfEmployees(page: anyString(), perPage: anyString(), completion: any()).then { (_, _, completion) in
                completion(.success(self.mockEmployeesDatailsResponse))
            }
        }

        serviceUnderTest.getEmployees(page: "mock-page-1", perPage: "mock-perPage-12")

        verify(mockView, times(1)).showLoadingIndicator()
        verify(mockRepository, times(1)).getListOfEmployees(page: anyString(), perPage: anyString(), completion: any())
        verify(mockView, times(1)).hideLoadingIndicator()
        verify(mockView, times(1)).displayEmployees(employees: any())
    }
    
    func testThatGetListOfMployeeIsSuccessfulButTheListIsEmpty() {
        stub(mockRepository) {  mock in
            mock.getListOfEmployees(page: anyString(), perPage: anyString(), completion: any()).then { (_, _, completion) in
                completion(.success(EmployeesDatailsResponse(page: 1,
                                                             perPage: 12,
                                                             total: 24,
                                                             totalPages: 5,
                                                             employees: [],
                                                             support: Support(url: "mock-url", text: "mock-text"))))
            }
        }

        serviceUnderTest.getEmployees(page: "mock-page-1", perPage: "mock-perPage-12")

        verify(mockView, times(1)).showLoadingIndicator()
        verify(mockRepository, times(1)).getListOfEmployees(page: anyString(), perPage: anyString(), completion: any())
        verify(mockView, times(1)).hideLoadingIndicator()
        verify(mockView, times(1)).displayEmptyView()
    }
    
    func testThatGetListOfMployeeFailsAndAnErrorIsDisplayed() {
        stub(mockRepository) {  mock in
            mock.getListOfEmployees(page: anyString(), perPage: anyString(), completion: any()).then { (_, _, completion) in
                completion(.failure(.unknown))
            }
        }

        serviceUnderTest.getEmployees(page: "mock-page-1", perPage: "mock-perPage-12")

        verify(mockView, times(1)).showLoadingIndicator()
        verify(mockRepository, times(1)).getListOfEmployees(page: anyString(), perPage: anyString(), completion: any())
        verify(mockView, times(1)).hideLoadingIndicator()
        verify(mockView, times(1)).displayErrorMessage(message: anyString())
    }
    
    private var mockEmployeesDatailsResponse: EmployeesDatailsResponse {
        return EmployeesDatailsResponse(page: 1,
                                        perPage: 12,
                                        total: 24,
                                        totalPages: 5,
                                        employees: [Employee(id: 1, email: "mock-email",
                                                             firstName: "mock-firstName",
                                                             lastName: "mock-lastName",
                                                             avatar: "mock-avatar-url")],
                                        support: Support(url: "mock-url", text: "mock-text"))
    }
}
