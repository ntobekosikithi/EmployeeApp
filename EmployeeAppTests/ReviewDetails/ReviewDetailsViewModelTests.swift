//
//  ReviewDetailsViewModelTests.swift
//  EmployeeAppTests
//
//  Created by ns90840 on 2024/02/12.
//

import Foundation
import XCTest
import Cuckoo
@testable import EmployeeApp

final class ReviewDetailsViewModelTests: XCTestCase {
    private var serviceUnderTest: ReviewDetailsViewModel!
    private var mockView: MockReviewDetailsView!
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
        mockView = MockReviewDetailsView()
        mockRepository = MockEmployeeRepository()
        serviceUnderTest = ReviewDetailsViewModel(view: mockView)
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
            mock.displaySuccessScreen().thenDoNothing()
        }
    }
    
    func testThatSubmitUserDetailsIsSuccessful() {
        stub(mockRepository) {  mock in
            mock.updateEmployeeDetails(dto: any(), completion: any()).then { (_, completion) in
                completion(.success(self.mockUpdateEmployeeResponse))
            }
        }

        serviceUnderTest.updateEmployeeDetails(dto: EmployeesDatailsDTO())

        verify(mockView, times(1)).showLoadingIndicator()
        verify(mockRepository, times(1)).updateEmployeeDetails(dto: any(), completion: any())
        verify(mockView, times(1)).hideLoadingIndicator()
        verify(mockView, times(1)).displaySuccessScreen()
    }

    func testThatSubmitUserDetailsFailsWithError() {
        stub(mockRepository) {  mock in
            mock.updateEmployeeDetails(dto: any(), completion: any()).then { (_, completion) in
                completion(.failure(.unknown))
            }
        }

        serviceUnderTest.updateEmployeeDetails(dto: EmployeesDatailsDTO())

        verify(mockView, times(1)).showLoadingIndicator()
        verify(mockRepository, times(1)).updateEmployeeDetails(dto: any(), completion: any())
        verify(mockView, times(1)).hideLoadingIndicator()
        verify(mockView, times(1)).displayErrorMessage(message: anyString())
    }
    
    private var mockUpdateEmployeeResponse: UpdateEmployeeResponse {
        return UpdateEmployeeResponse(id: "mock-id",
                                      createdAt: "mock-date",
                                      userLoginToken: "mock-token",
                                      personalDetails: mockPersonalDetails,
                                      additionalInformation: mockAdditionalInformation)
    }
    
    private var mockPersonalDetails: PersonalDetails {
        return PersonalDetails(id: "mock-id",
                                              email: "mock-email",
                                              firstName: "mock-firstName",
                                              lastName: "mock-lastName",
                                              avatar: "mock-avatar",
                                              dob: "mock-dob",
                                              gender: "mock-gender")
    }
    
    private var mockAdditionalInformation: AdditionalInformation {
        return AdditionalInformation(placeOfBirth: "mock-placeOfBirth",
                                                   preferredColor: "mock-preferredColor",
                                                   residentialAddress: "mock-residentialAddress")
    }
}
