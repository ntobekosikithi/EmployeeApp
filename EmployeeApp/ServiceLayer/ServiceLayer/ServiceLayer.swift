//
//  ServiceLayer.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    // Add more methods as needed
}

protocol ServiceLayer {
    func Get<T: Decodable>(url: String, headers: [String : String]?, responseModel: T.Type, completion: @escaping (Result<T, ServiceError>) -> Void)
    func Post<T: Decodable>(url: String, parameters: Data?, headers: [String : String]?, responseModel: T.Type, completion: @escaping (Result<T, ServiceError>) -> Void)
}

class ServiceLayerImplementation: ServiceLayer {

    func Get<T: Decodable>(url: String, headers: [String : String]? = nil, responseModel: T.Type, completion: @escaping (Result<T, ServiceError>) -> Void) {
        sendRequest(url: url, method: .get, headers: headers, responseModel: responseModel, completion: completion)
    }

    func Post<T: Decodable>(url: String, parameters: Data? = nil, headers: [String : String]? = nil, responseModel: T.Type, completion: @escaping (Result<T, ServiceError>) -> Void) {
        sendRequest(url: url, method: .post, parameters: parameters, headers: headers, responseModel: responseModel, completion: completion)
    }
}

extension ServiceLayerImplementation {
    private func sendRequest<T: Decodable>(url: String,
                                           method: HTTPMethod = .get,
                                           parameters: Data? = nil,
                                           headers: [String : String]? = nil,
                                           responseModel: T.Type,
                                           completion: @escaping (Result<T, ServiceError>) -> Void) {

        guard let url = URL(string: url) else {
            completion(.failure(.wrongRequest))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        if method == .post {
            request.httpBody = parameters
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                completion(.failure(.unknown))
                return
            }

            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.notResults))
                return
            }

            switch response.statusCode {
            case 200...299:
                guard let data = data, let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    completion(.failure(.parsingError))
                    return
                }
                completion(.success(decodedResponse))
            case 400...403:
                completion(.failure(.unauthorized))
            default:
                completion(.failure(.serverError(code: response.statusCode)))
            }
        }.resume()
    }
}

