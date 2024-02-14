// MARK: - Mocks generated from file: EmployeeApp/ListOfEmployees/View/ListOfEmployeesView.swift at 2024-02-14 14:35:01 +0000

//
//  ListOfEmployeesView.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Cuckoo
@testable import EmployeeApp

import Foundation






 class MockListOfEmployeesView: ListOfEmployeesView, Cuckoo.ProtocolMock {
    
     typealias MocksType = ListOfEmployeesView
    
     typealias Stubbing = __StubbingProxy_ListOfEmployeesView
     typealias Verification = __VerificationProxy_ListOfEmployeesView

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ListOfEmployeesView?

     func enableDefaultImplementation(_ stub: ListOfEmployeesView) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func showLoadingIndicator()  {
        
    return cuckoo_manager.call(
    """
    showLoadingIndicator()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.showLoadingIndicator())
        
    }
    
    
    
    
    
     func hideLoadingIndicator()  {
        
    return cuckoo_manager.call(
    """
    hideLoadingIndicator()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.hideLoadingIndicator())
        
    }
    
    
    
    
    
     func displayEmployees(employees: EmployeesDatailsResponse)  {
        
    return cuckoo_manager.call(
    """
    displayEmployees(employees: EmployeesDatailsResponse)
    """,
            parameters: (employees),
            escapingParameters: (employees),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.displayEmployees(employees: employees))
        
    }
    
    
    
    
    
     func displayEmptyView()  {
        
    return cuckoo_manager.call(
    """
    displayEmptyView()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.displayEmptyView())
        
    }
    
    
    
    
    
     func displayErrorMessage(message: String)  {
        
    return cuckoo_manager.call(
    """
    displayErrorMessage(message: String)
    """,
            parameters: (message),
            escapingParameters: (message),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.displayErrorMessage(message: message))
        
    }
    
    

     struct __StubbingProxy_ListOfEmployeesView: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func showLoadingIndicator() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockListOfEmployeesView.self, method:
    """
    showLoadingIndicator()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func hideLoadingIndicator() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockListOfEmployeesView.self, method:
    """
    hideLoadingIndicator()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func displayEmployees<M1: Cuckoo.Matchable>(employees: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(EmployeesDatailsResponse)> where M1.MatchedType == EmployeesDatailsResponse {
            let matchers: [Cuckoo.ParameterMatcher<(EmployeesDatailsResponse)>] = [wrap(matchable: employees) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockListOfEmployeesView.self, method:
    """
    displayEmployees(employees: EmployeesDatailsResponse)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func displayEmptyView() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockListOfEmployeesView.self, method:
    """
    displayEmptyView()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func displayErrorMessage<M1: Cuckoo.Matchable>(message: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: message) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockListOfEmployeesView.self, method:
    """
    displayErrorMessage(message: String)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_ListOfEmployeesView: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func showLoadingIndicator() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    showLoadingIndicator()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func hideLoadingIndicator() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    hideLoadingIndicator()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func displayEmployees<M1: Cuckoo.Matchable>(employees: M1) -> Cuckoo.__DoNotUse<(EmployeesDatailsResponse), Void> where M1.MatchedType == EmployeesDatailsResponse {
            let matchers: [Cuckoo.ParameterMatcher<(EmployeesDatailsResponse)>] = [wrap(matchable: employees) { $0 }]
            return cuckoo_manager.verify(
    """
    displayEmployees(employees: EmployeesDatailsResponse)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func displayEmptyView() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    displayEmptyView()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func displayErrorMessage<M1: Cuckoo.Matchable>(message: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: message) { $0 }]
            return cuckoo_manager.verify(
    """
    displayErrorMessage(message: String)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class ListOfEmployeesViewStub: ListOfEmployeesView {
    

    

    
    
    
    
     func showLoadingIndicator()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func hideLoadingIndicator()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func displayEmployees(employees: EmployeesDatailsResponse)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func displayEmptyView()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func displayErrorMessage(message: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





// MARK: - Mocks generated from file: EmployeeApp/Login/View/LoginView.swift at 2024-02-14 14:35:01 +0000

//
//  LoginView.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Cuckoo
@testable import EmployeeApp

import Foundation






 class MockLoginView: LoginView, Cuckoo.ProtocolMock {
    
     typealias MocksType = LoginView
    
     typealias Stubbing = __StubbingProxy_LoginView
     typealias Verification = __VerificationProxy_LoginView

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: LoginView?

     func enableDefaultImplementation(_ stub: LoginView) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func showLoadingIndicator()  {
        
    return cuckoo_manager.call(
    """
    showLoadingIndicator()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.showLoadingIndicator())
        
    }
    
    
    
    
    
     func hideLoadingIndicator()  {
        
    return cuckoo_manager.call(
    """
    hideLoadingIndicator()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.hideLoadingIndicator())
        
    }
    
    
    
    
    
     func displayErrorMessage(message: String)  {
        
    return cuckoo_manager.call(
    """
    displayErrorMessage(message: String)
    """,
            parameters: (message),
            escapingParameters: (message),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.displayErrorMessage(message: message))
        
    }
    
    
    
    
    
     func navigateToEmployeeDetails()  {
        
    return cuckoo_manager.call(
    """
    navigateToEmployeeDetails()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.navigateToEmployeeDetails())
        
    }
    
    

     struct __StubbingProxy_LoginView: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func showLoadingIndicator() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockLoginView.self, method:
    """
    showLoadingIndicator()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func hideLoadingIndicator() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockLoginView.self, method:
    """
    hideLoadingIndicator()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func displayErrorMessage<M1: Cuckoo.Matchable>(message: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: message) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockLoginView.self, method:
    """
    displayErrorMessage(message: String)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func navigateToEmployeeDetails() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockLoginView.self, method:
    """
    navigateToEmployeeDetails()
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_LoginView: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func showLoadingIndicator() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    showLoadingIndicator()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func hideLoadingIndicator() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    hideLoadingIndicator()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func displayErrorMessage<M1: Cuckoo.Matchable>(message: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: message) { $0 }]
            return cuckoo_manager.verify(
    """
    displayErrorMessage(message: String)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func navigateToEmployeeDetails() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    navigateToEmployeeDetails()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class LoginViewStub: LoginView {
    

    

    
    
    
    
     func showLoadingIndicator()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func hideLoadingIndicator()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func displayErrorMessage(message: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func navigateToEmployeeDetails()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





// MARK: - Mocks generated from file: EmployeeApp/Repository/EmployeeRepository.swift at 2024-02-14 14:35:01 +0000

//
//  EmployeeRepository.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Cuckoo
@testable import EmployeeApp

import Foundation






 class MockEmployeeRepository: EmployeeRepository, Cuckoo.ProtocolMock {
    
     typealias MocksType = EmployeeRepository
    
     typealias Stubbing = __StubbingProxy_EmployeeRepository
     typealias Verification = __VerificationProxy_EmployeeRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: EmployeeRepository?

     func enableDefaultImplementation(_ stub: EmployeeRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func login(with email: String, password: String, completion: @escaping (Result<AuthenticationResponse, ServiceError>) -> Void)  {
        
    return cuckoo_manager.call(
    """
    login(with: String, password: String, completion: @escaping (Result<AuthenticationResponse, ServiceError>) -> Void)
    """,
            parameters: (email, password, completion),
            escapingParameters: (email, password, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.login(with: email, password: password, completion: completion))
        
    }
    
    
    
    
    
     func getListOfEmployees(page: String, perPage: String, completion: @escaping (Result<EmployeesDatailsResponse, ServiceError>) -> Void)  {
        
    return cuckoo_manager.call(
    """
    getListOfEmployees(page: String, perPage: String, completion: @escaping (Result<EmployeesDatailsResponse, ServiceError>) -> Void)
    """,
            parameters: (page, perPage, completion),
            escapingParameters: (page, perPage, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getListOfEmployees(page: page, perPage: perPage, completion: completion))
        
    }
    
    
    
    
    
     func gePreferredColors(perPage: String, completion: @escaping (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)  {
        
    return cuckoo_manager.call(
    """
    gePreferredColors(perPage: String, completion: @escaping (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)
    """,
            parameters: (perPage, completion),
            escapingParameters: (perPage, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.gePreferredColors(perPage: perPage, completion: completion))
        
    }
    
    
    
    
    
     func updateEmployeeDetails(dto: EmployeesDatailsDTO, completion: @escaping (Result<UpdateEmployeeResponse, ServiceError>) -> Void)  {
        
    return cuckoo_manager.call(
    """
    updateEmployeeDetails(dto: EmployeesDatailsDTO, completion: @escaping (Result<UpdateEmployeeResponse, ServiceError>) -> Void)
    """,
            parameters: (dto, completion),
            escapingParameters: (dto, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.updateEmployeeDetails(dto: dto, completion: completion))
        
    }
    
    

     struct __StubbingProxy_EmployeeRepository: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(with email: M1, password: M2, completion: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, String, (Result<AuthenticationResponse, ServiceError>) -> Void)> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (Result<AuthenticationResponse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (Result<AuthenticationResponse, ServiceError>) -> Void)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEmployeeRepository.self, method:
    """
    login(with: String, password: String, completion: @escaping (Result<AuthenticationResponse, ServiceError>) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func getListOfEmployees<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(page: M1, perPage: M2, completion: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, String, (Result<EmployeesDatailsResponse, ServiceError>) -> Void)> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (Result<EmployeesDatailsResponse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (Result<EmployeesDatailsResponse, ServiceError>) -> Void)>] = [wrap(matchable: page) { $0.0 }, wrap(matchable: perPage) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEmployeeRepository.self, method:
    """
    getListOfEmployees(page: String, perPage: String, completion: @escaping (Result<EmployeesDatailsResponse, ServiceError>) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func gePreferredColors<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(perPage: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)> where M1.MatchedType == String, M2.MatchedType == (Result<ColorsDetailsRepsonse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)>] = [wrap(matchable: perPage) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEmployeeRepository.self, method:
    """
    gePreferredColors(perPage: String, completion: @escaping (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func updateEmployeeDetails<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(dto: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(EmployeesDatailsDTO, (Result<UpdateEmployeeResponse, ServiceError>) -> Void)> where M1.MatchedType == EmployeesDatailsDTO, M2.MatchedType == (Result<UpdateEmployeeResponse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(EmployeesDatailsDTO, (Result<UpdateEmployeeResponse, ServiceError>) -> Void)>] = [wrap(matchable: dto) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEmployeeRepository.self, method:
    """
    updateEmployeeDetails(dto: EmployeesDatailsDTO, completion: @escaping (Result<UpdateEmployeeResponse, ServiceError>) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_EmployeeRepository: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(with email: M1, password: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, (Result<AuthenticationResponse, ServiceError>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (Result<AuthenticationResponse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (Result<AuthenticationResponse, ServiceError>) -> Void)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    login(with: String, password: String, completion: @escaping (Result<AuthenticationResponse, ServiceError>) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func getListOfEmployees<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(page: M1, perPage: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, (Result<EmployeesDatailsResponse, ServiceError>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (Result<EmployeesDatailsResponse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (Result<EmployeesDatailsResponse, ServiceError>) -> Void)>] = [wrap(matchable: page) { $0.0 }, wrap(matchable: perPage) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    getListOfEmployees(page: String, perPage: String, completion: @escaping (Result<EmployeesDatailsResponse, ServiceError>) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func gePreferredColors<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(perPage: M1, completion: M2) -> Cuckoo.__DoNotUse<(String, (Result<ColorsDetailsRepsonse, ServiceError>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == (Result<ColorsDetailsRepsonse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)>] = [wrap(matchable: perPage) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return cuckoo_manager.verify(
    """
    gePreferredColors(perPage: String, completion: @escaping (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func updateEmployeeDetails<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(dto: M1, completion: M2) -> Cuckoo.__DoNotUse<(EmployeesDatailsDTO, (Result<UpdateEmployeeResponse, ServiceError>) -> Void), Void> where M1.MatchedType == EmployeesDatailsDTO, M2.MatchedType == (Result<UpdateEmployeeResponse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(EmployeesDatailsDTO, (Result<UpdateEmployeeResponse, ServiceError>) -> Void)>] = [wrap(matchable: dto) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return cuckoo_manager.verify(
    """
    updateEmployeeDetails(dto: EmployeesDatailsDTO, completion: @escaping (Result<UpdateEmployeeResponse, ServiceError>) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class EmployeeRepositoryStub: EmployeeRepository {
    

    

    
    
    
    
     func login(with email: String, password: String, completion: @escaping (Result<AuthenticationResponse, ServiceError>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func getListOfEmployees(page: String, perPage: String, completion: @escaping (Result<EmployeesDatailsResponse, ServiceError>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func gePreferredColors(perPage: String, completion: @escaping (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func updateEmployeeDetails(dto: EmployeesDatailsDTO, completion: @escaping (Result<UpdateEmployeeResponse, ServiceError>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}










 class MockEmployeeRepositoryImplementation: EmployeeRepositoryImplementation, Cuckoo.ClassMock {
    
     typealias MocksType = EmployeeRepositoryImplementation
    
     typealias Stubbing = __StubbingProxy_EmployeeRepositoryImplementation
     typealias Verification = __VerificationProxy_EmployeeRepositoryImplementation

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: EmployeeRepositoryImplementation?

     func enableDefaultImplementation(_ stub: EmployeeRepositoryImplementation) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     override func login(with email: String, password: String, completion: @escaping (Result<AuthenticationResponse, ServiceError>) -> Void)  {
        
    return cuckoo_manager.call(
    """
    login(with: String, password: String, completion: @escaping (Result<AuthenticationResponse, ServiceError>) -> Void)
    """,
            parameters: (email, password, completion),
            escapingParameters: (email, password, completion),
            superclassCall:
                
                super.login(with: email, password: password, completion: completion)
                ,
            defaultCall: __defaultImplStub!.login(with: email, password: password, completion: completion))
        
    }
    
    
    
    
    
     override func getListOfEmployees(page: String, perPage: String, completion: @escaping (Result<EmployeesDatailsResponse, ServiceError>) -> Void)  {
        
    return cuckoo_manager.call(
    """
    getListOfEmployees(page: String, perPage: String, completion: @escaping (Result<EmployeesDatailsResponse, ServiceError>) -> Void)
    """,
            parameters: (page, perPage, completion),
            escapingParameters: (page, perPage, completion),
            superclassCall:
                
                super.getListOfEmployees(page: page, perPage: perPage, completion: completion)
                ,
            defaultCall: __defaultImplStub!.getListOfEmployees(page: page, perPage: perPage, completion: completion))
        
    }
    
    
    
    
    
     override func gePreferredColors(perPage: String, completion: @escaping (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)  {
        
    return cuckoo_manager.call(
    """
    gePreferredColors(perPage: String, completion: @escaping (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)
    """,
            parameters: (perPage, completion),
            escapingParameters: (perPage, completion),
            superclassCall:
                
                super.gePreferredColors(perPage: perPage, completion: completion)
                ,
            defaultCall: __defaultImplStub!.gePreferredColors(perPage: perPage, completion: completion))
        
    }
    
    
    
    
    
     override func updateEmployeeDetails(dto: EmployeesDatailsDTO, completion: @escaping (Result<UpdateEmployeeResponse, ServiceError>) -> Void)  {
        
    return cuckoo_manager.call(
    """
    updateEmployeeDetails(dto: EmployeesDatailsDTO, completion: @escaping (Result<UpdateEmployeeResponse, ServiceError>) -> Void)
    """,
            parameters: (dto, completion),
            escapingParameters: (dto, completion),
            superclassCall:
                
                super.updateEmployeeDetails(dto: dto, completion: completion)
                ,
            defaultCall: __defaultImplStub!.updateEmployeeDetails(dto: dto, completion: completion))
        
    }
    
    

     struct __StubbingProxy_EmployeeRepositoryImplementation: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(with email: M1, password: M2, completion: M3) -> Cuckoo.ClassStubNoReturnFunction<(String, String, (Result<AuthenticationResponse, ServiceError>) -> Void)> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (Result<AuthenticationResponse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (Result<AuthenticationResponse, ServiceError>) -> Void)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEmployeeRepositoryImplementation.self, method:
    """
    login(with: String, password: String, completion: @escaping (Result<AuthenticationResponse, ServiceError>) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func getListOfEmployees<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(page: M1, perPage: M2, completion: M3) -> Cuckoo.ClassStubNoReturnFunction<(String, String, (Result<EmployeesDatailsResponse, ServiceError>) -> Void)> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (Result<EmployeesDatailsResponse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (Result<EmployeesDatailsResponse, ServiceError>) -> Void)>] = [wrap(matchable: page) { $0.0 }, wrap(matchable: perPage) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEmployeeRepositoryImplementation.self, method:
    """
    getListOfEmployees(page: String, perPage: String, completion: @escaping (Result<EmployeesDatailsResponse, ServiceError>) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func gePreferredColors<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(perPage: M1, completion: M2) -> Cuckoo.ClassStubNoReturnFunction<(String, (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)> where M1.MatchedType == String, M2.MatchedType == (Result<ColorsDetailsRepsonse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)>] = [wrap(matchable: perPage) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEmployeeRepositoryImplementation.self, method:
    """
    gePreferredColors(perPage: String, completion: @escaping (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func updateEmployeeDetails<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(dto: M1, completion: M2) -> Cuckoo.ClassStubNoReturnFunction<(EmployeesDatailsDTO, (Result<UpdateEmployeeResponse, ServiceError>) -> Void)> where M1.MatchedType == EmployeesDatailsDTO, M2.MatchedType == (Result<UpdateEmployeeResponse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(EmployeesDatailsDTO, (Result<UpdateEmployeeResponse, ServiceError>) -> Void)>] = [wrap(matchable: dto) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEmployeeRepositoryImplementation.self, method:
    """
    updateEmployeeDetails(dto: EmployeesDatailsDTO, completion: @escaping (Result<UpdateEmployeeResponse, ServiceError>) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_EmployeeRepositoryImplementation: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(with email: M1, password: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, (Result<AuthenticationResponse, ServiceError>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (Result<AuthenticationResponse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (Result<AuthenticationResponse, ServiceError>) -> Void)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    login(with: String, password: String, completion: @escaping (Result<AuthenticationResponse, ServiceError>) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func getListOfEmployees<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(page: M1, perPage: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, (Result<EmployeesDatailsResponse, ServiceError>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (Result<EmployeesDatailsResponse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (Result<EmployeesDatailsResponse, ServiceError>) -> Void)>] = [wrap(matchable: page) { $0.0 }, wrap(matchable: perPage) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    getListOfEmployees(page: String, perPage: String, completion: @escaping (Result<EmployeesDatailsResponse, ServiceError>) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func gePreferredColors<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(perPage: M1, completion: M2) -> Cuckoo.__DoNotUse<(String, (Result<ColorsDetailsRepsonse, ServiceError>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == (Result<ColorsDetailsRepsonse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)>] = [wrap(matchable: perPage) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return cuckoo_manager.verify(
    """
    gePreferredColors(perPage: String, completion: @escaping (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func updateEmployeeDetails<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(dto: M1, completion: M2) -> Cuckoo.__DoNotUse<(EmployeesDatailsDTO, (Result<UpdateEmployeeResponse, ServiceError>) -> Void), Void> where M1.MatchedType == EmployeesDatailsDTO, M2.MatchedType == (Result<UpdateEmployeeResponse, ServiceError>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(EmployeesDatailsDTO, (Result<UpdateEmployeeResponse, ServiceError>) -> Void)>] = [wrap(matchable: dto) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return cuckoo_manager.verify(
    """
    updateEmployeeDetails(dto: EmployeesDatailsDTO, completion: @escaping (Result<UpdateEmployeeResponse, ServiceError>) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class EmployeeRepositoryImplementationStub: EmployeeRepositoryImplementation {
    

    

    
    
    
    
     override func login(with email: String, password: String, completion: @escaping (Result<AuthenticationResponse, ServiceError>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func getListOfEmployees(page: String, perPage: String, completion: @escaping (Result<EmployeesDatailsResponse, ServiceError>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func gePreferredColors(perPage: String, completion: @escaping (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func updateEmployeeDetails(dto: EmployeesDatailsDTO, completion: @escaping (Result<UpdateEmployeeResponse, ServiceError>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





// MARK: - Mocks generated from file: EmployeeApp/ReviewDetails/View/ReviewDetailsView.swift at 2024-02-14 14:35:01 +0000

//
//  ReviewDetailsView.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/11.
//

import Cuckoo
@testable import EmployeeApp

import Foundation






 class MockReviewDetailsView: ReviewDetailsView, Cuckoo.ProtocolMock {
    
     typealias MocksType = ReviewDetailsView
    
     typealias Stubbing = __StubbingProxy_ReviewDetailsView
     typealias Verification = __VerificationProxy_ReviewDetailsView

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ReviewDetailsView?

     func enableDefaultImplementation(_ stub: ReviewDetailsView) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func showLoadingIndicator()  {
        
    return cuckoo_manager.call(
    """
    showLoadingIndicator()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.showLoadingIndicator())
        
    }
    
    
    
    
    
     func hideLoadingIndicator()  {
        
    return cuckoo_manager.call(
    """
    hideLoadingIndicator()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.hideLoadingIndicator())
        
    }
    
    
    
    
    
     func displaySuccessScreen()  {
        
    return cuckoo_manager.call(
    """
    displaySuccessScreen()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.displaySuccessScreen())
        
    }
    
    
    
    
    
     func displayErrorMessage(message: String)  {
        
    return cuckoo_manager.call(
    """
    displayErrorMessage(message: String)
    """,
            parameters: (message),
            escapingParameters: (message),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.displayErrorMessage(message: message))
        
    }
    
    

     struct __StubbingProxy_ReviewDetailsView: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func showLoadingIndicator() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockReviewDetailsView.self, method:
    """
    showLoadingIndicator()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func hideLoadingIndicator() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockReviewDetailsView.self, method:
    """
    hideLoadingIndicator()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func displaySuccessScreen() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockReviewDetailsView.self, method:
    """
    displaySuccessScreen()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func displayErrorMessage<M1: Cuckoo.Matchable>(message: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: message) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockReviewDetailsView.self, method:
    """
    displayErrorMessage(message: String)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_ReviewDetailsView: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func showLoadingIndicator() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    showLoadingIndicator()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func hideLoadingIndicator() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    hideLoadingIndicator()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func displaySuccessScreen() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    displaySuccessScreen()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func displayErrorMessage<M1: Cuckoo.Matchable>(message: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: message) { $0 }]
            return cuckoo_manager.verify(
    """
    displayErrorMessage(message: String)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class ReviewDetailsViewStub: ReviewDetailsView {
    

    

    
    
    
    
     func showLoadingIndicator()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func hideLoadingIndicator()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func displaySuccessScreen()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func displayErrorMessage(message: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





// MARK: - Mocks generated from file: EmployeeApp/SelectPrefferedColor/View/SelectPreferredColorView.swift at 2024-02-14 14:35:01 +0000

//
//  SelectPreferredColorView.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Cuckoo
@testable import EmployeeApp

import Foundation






 class MockSelectPreferredColorView: SelectPreferredColorView, Cuckoo.ProtocolMock {
    
     typealias MocksType = SelectPreferredColorView
    
     typealias Stubbing = __StubbingProxy_SelectPreferredColorView
     typealias Verification = __VerificationProxy_SelectPreferredColorView

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: SelectPreferredColorView?

     func enableDefaultImplementation(_ stub: SelectPreferredColorView) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func showLoadingIndicator()  {
        
    return cuckoo_manager.call(
    """
    showLoadingIndicator()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.showLoadingIndicator())
        
    }
    
    
    
    
    
     func hideLoadingIndicator()  {
        
    return cuckoo_manager.call(
    """
    hideLoadingIndicator()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.hideLoadingIndicator())
        
    }
    
    
    
    
    
     func displayColors(colors: ColorsDetailsRepsonse)  {
        
    return cuckoo_manager.call(
    """
    displayColors(colors: ColorsDetailsRepsonse)
    """,
            parameters: (colors),
            escapingParameters: (colors),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.displayColors(colors: colors))
        
    }
    
    
    
    
    
     func displayErrorMessage(message: String)  {
        
    return cuckoo_manager.call(
    """
    displayErrorMessage(message: String)
    """,
            parameters: (message),
            escapingParameters: (message),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.displayErrorMessage(message: message))
        
    }
    
    
    
    
    
     func displayEmptyView()  {
        
    return cuckoo_manager.call(
    """
    displayEmptyView()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.displayEmptyView())
        
    }
    
    

     struct __StubbingProxy_SelectPreferredColorView: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func showLoadingIndicator() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockSelectPreferredColorView.self, method:
    """
    showLoadingIndicator()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func hideLoadingIndicator() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockSelectPreferredColorView.self, method:
    """
    hideLoadingIndicator()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func displayColors<M1: Cuckoo.Matchable>(colors: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(ColorsDetailsRepsonse)> where M1.MatchedType == ColorsDetailsRepsonse {
            let matchers: [Cuckoo.ParameterMatcher<(ColorsDetailsRepsonse)>] = [wrap(matchable: colors) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockSelectPreferredColorView.self, method:
    """
    displayColors(colors: ColorsDetailsRepsonse)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func displayErrorMessage<M1: Cuckoo.Matchable>(message: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: message) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockSelectPreferredColorView.self, method:
    """
    displayErrorMessage(message: String)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func displayEmptyView() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockSelectPreferredColorView.self, method:
    """
    displayEmptyView()
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_SelectPreferredColorView: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func showLoadingIndicator() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    showLoadingIndicator()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func hideLoadingIndicator() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    hideLoadingIndicator()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func displayColors<M1: Cuckoo.Matchable>(colors: M1) -> Cuckoo.__DoNotUse<(ColorsDetailsRepsonse), Void> where M1.MatchedType == ColorsDetailsRepsonse {
            let matchers: [Cuckoo.ParameterMatcher<(ColorsDetailsRepsonse)>] = [wrap(matchable: colors) { $0 }]
            return cuckoo_manager.verify(
    """
    displayColors(colors: ColorsDetailsRepsonse)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func displayErrorMessage<M1: Cuckoo.Matchable>(message: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: message) { $0 }]
            return cuckoo_manager.verify(
    """
    displayErrorMessage(message: String)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func displayEmptyView() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    displayEmptyView()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class SelectPreferredColorViewStub: SelectPreferredColorView {
    

    

    
    
    
    
     func showLoadingIndicator()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func hideLoadingIndicator()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func displayColors(colors: ColorsDetailsRepsonse)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func displayErrorMessage(message: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func displayEmptyView()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}




