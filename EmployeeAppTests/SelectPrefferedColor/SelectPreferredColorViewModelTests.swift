//
//  SelectPreferredColorViewModelTests.swift
//  EmployeeAppTests
//
//  Created by ns90840 on 2024/02/12.
//

import Foundation
import XCTest
import Cuckoo
@testable import EmployeeApp

final class SelectPreferredColorViewModelTests: XCTestCase {
    private var serviceUnderTest: SelectPreferredColorViewModel!
    private var mockView: MockSelectPreferredColorView!
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
        mockView = MockSelectPreferredColorView()
        mockRepository = MockEmployeeRepository()
        serviceUnderTest = SelectPreferredColorViewModel(view: mockView)
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
            mock.displayColors(colors: any()).thenDoNothing()
            mock.displayEmptyView().thenDoNothing()
        }
    }
    
    func testThatGetListOfColorsIsSuccessfulAndDisplaysColors() {
        stub(mockRepository) {  mock in
            mock.gePreferredColors(perPage: anyString(), completion: any()).then { (_, completion) in
                completion(.success(self.mockColorsDetailsRepsonse))
            }
        }

        serviceUnderTest.getPreferredColors(perPage: "mock-perPage-12")

        verify(mockView, times(1)).showLoadingIndicator()
        verify(mockRepository, times(1)).gePreferredColors(perPage: anyString(), completion: any())
        verify(mockView, times(1)).hideLoadingIndicator()
        verify(mockView, times(1)).displayColors(colors: any())
    }
    
    func testThatGetListOfColorsIsSuccessfulButTheListIsEmpty() {
        stub(mockRepository) {  mock in
            mock.gePreferredColors(perPage: anyString(), completion: any()).then { (_, completion) in
                completion(.success(ColorsDetailsRepsonse(page: 1,
                                                          perPage: 12,
                                                          total: 12, totalPages: 15,
                                                          colors: [])))
            }
        }

        serviceUnderTest.getPreferredColors(perPage: "mock-perPage-12")

        verify(mockView, times(1)).showLoadingIndicator()
        verify(mockRepository, times(1)).gePreferredColors(perPage: anyString(), completion: any())
        verify(mockView, times(1)).hideLoadingIndicator()
        verify(mockView, times(1)).displayEmptyView()
    }
    
    func testThatGetListOfColorFailsAndAnErrorIsDisplayed() {
        stub(mockRepository) {  mock in
            mock.gePreferredColors(perPage: anyString(), completion: any()).then { (_, completion) in
                completion(.failure(.unknown))
            }
        }

        serviceUnderTest.getPreferredColors(perPage: "mock-perPage-12")

        verify(mockView, times(1)).showLoadingIndicator()
        verify(mockRepository, times(1)).gePreferredColors(perPage: anyString(), completion: any())
        verify(mockView, times(1)).hideLoadingIndicator()
        verify(mockView, times(1)).displayErrorMessage(message: anyString())
    }
    
    private var mockColorsDetailsRepsonse: ColorsDetailsRepsonse {
        return ColorsDetailsRepsonse(page: 1,
                                     perPage: 12,
                                     total: 12, totalPages: 15,
                                     colors: [Color(id: 1,
                                                    year: 2004,
                                                    name: "mock-name",
                                                    color: "mock-color",
                                                    pantoneValue: "mock-value")])
    }
}
