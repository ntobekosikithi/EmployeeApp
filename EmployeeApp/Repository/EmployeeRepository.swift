//
//  EmployeeRepository.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

protocol EmployeeRepository {
    func login(with email: String, password: String, completion: @escaping (Result<AuthenticationResponse, ServiceError>) -> Void)
    func getListOfEmployees(page: String, perPage: String, completion: @escaping (Result<EmployeesDatailsResponse, ServiceError>) -> Void)
    func gePreferredColors(perPage: String, completion: @escaping (Result<ColorsDetailsRepsonse, ServiceError>) -> Void)
    func updateEmployeeDetails(dto: EmployeesDatailsDTO, completion: @escaping (Result<UpdateEmployeeResponse, ServiceError>) -> Void)
}

class EmployeeRepositoryImplementation: EmployeeRepository {
    
    @Inject private var service: ServiceLayer
    
    func login(with email: String, password: String, completion: @escaping (Result<AuthenticationResponse, ServiceError>) -> Void) {
        var parameterBuilder = ParameterBuilder()
        parameterBuilder.addParameter("email", value: email)
        parameterBuilder.addParameter("password", value: password)
        let parameters = parameterBuilder.build()
        service.Post(url: EndPoints.loginEndPoint(), parameters: parameters, headers: nil, responseModel: AuthenticationResponse.self) { results in
            completion(results)
        }
    }
    
    func getListOfEmployees(page: String, perPage: String, completion: @escaping (Result<EmployeesDatailsResponse, ServiceError>) -> Void) {
        let token = AuthenticationManager.shared.getUserToken()
        var headerBuilder = HeaderBuilder()
        headerBuilder.addHeader("Authorization", value: "Bearer \(token)")
        let headers = headerBuilder.build()
        service.Get(url: EndPoints.usersEndPoint(page: page, perPage: perPage), headers: headers, responseModel: EmployeesDatailsResponse.self) { results in
            completion(results)
        }
        
    }
    
    func gePreferredColors(perPage: String, completion: @escaping (Result<ColorsDetailsRepsonse, ServiceError>) -> Void) {
        let token = AuthenticationManager.shared.getUserToken()
        var headerBuilder = HeaderBuilder()
        headerBuilder.addHeader("Authorization", value: "Bearer \(token)")
        let headers = headerBuilder.build()
        service.Get(url: EndPoints.colorsEndPoint(perPage: perPage), headers: headers, responseModel: ColorsDetailsRepsonse.self) { results in
            completion(results)
        }
    }
    
    func updateEmployeeDetails(dto: EmployeesDatailsDTO, completion: @escaping (Result<UpdateEmployeeResponse, ServiceError>) -> Void) {
        let request = createUpdateEmployeeRequest(dto: dto)
        let parameters = ModelToJSONDataHelper.convert(request)
        service.Post(url: EndPoints.usersEndPoint(), parameters: parameters, headers: nil, responseModel: UpdateEmployeeResponse.self) { results in
            completion(results)
        }
    }
    
    private func createUpdateEmployeeRequest(dto: EmployeesDatailsDTO) -> UpdateEmployeeRequest {
        let token = AuthenticationManager.shared.getUserToken()
        let personalDetails = PersonalDetails(id: "\(dto.employee?.id ?? 0)",
                                              email: dto.employee?.email ?? "",
                                              firstName: dto.employee?.firstName ?? "",
                                              lastName: dto.employee?.lastName ?? "",
                                              avatar: dto.employee?.avatar ?? "",
                                              dob: dto.dateOfBirth ?? "",
                                              gender: dto.gender ?? "")
        
        let additionalInfo = AdditionalInformation(placeOfBirth: dto.placeOfBirth ?? "",
                                                   preferredColor: dto.preferredColor?.color ?? "",
                                                   residentialAddress: dto.residentionAddress ?? "")
        
        return UpdateEmployeeRequest(userLoginToken: token, personalDetails: personalDetails, additionalInformation: additionalInfo)
    }
}
