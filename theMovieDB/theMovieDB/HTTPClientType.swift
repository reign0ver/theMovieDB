//
//  HTTPClient.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import Foundation
import Alamofire

enum NetworkError: Swift.Error {
    case invalidURL
    case responseSerializacion
    case noInternetConnection
    case unhandledError
}

typealias NetworkResponse<T: Codable> = (Swift.Result<ServerResponse<T>, NetworkError>) -> Void

protocol HTTPClientType {
    func sendRequest<T: Codable>(_ endpoint: EndpointType, of: T.Type, completion: @escaping (Swift.Result<ServerResponse<T>, NetworkError>) -> Void)
}

final class HTTPClient: HTTPClientType {
    
    func sendRequest<T: Codable>(_ endpoint: EndpointType, 
                                 of: T.Type, 
                                 completion: @escaping NetworkResponse<T>) {
        
        guard let urlRequest = try? endpoint.asURLRequest() else {
            completion(.failure(.invalidURL))
            return
        }
        
        let dataRequest = AF.request(urlRequest)
        dataRequest.responseDecodable(of: ServerResponse<T>.self, queue: .global(qos: .background)) { dataResponse in
            switch dataResponse.result {
            case .success(let serverResponse):
                completion(.success(serverResponse))
                break
            case .failure(let error):
                self.handleError(error, completion: completion)
            }
        }
    }
    
    private func handleError<T: Codable>(_ error: AFError, completion: @escaping NetworkResponse<T>) {
        if error.isResponseSerializationError {
            completion(.failure(.responseSerializacion))
            return
        }
        
        if error.isInvalidURLError {
            completion(.failure(.invalidURL))
            return
        }
        
        if let urlError = error.underlyingError as? URLError {
            switch urlError.code {
            case .notConnectedToInternet:
                completion(.failure(.noInternetConnection))
            default:
                completion(.failure(.unhandledError))
            }
            return
        }
    }
}
