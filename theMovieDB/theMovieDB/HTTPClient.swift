//
//  HTTPClient.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 24/12/21.
//

import Foundation
import Alamofire

final class HTTPClient: HTTPClientType {
    
    func sendRequest<T: Codable>(_ endpoint: EndpointType, 
                                 of: T.Type, 
                                 completion: @escaping NetworkResponse<T>) {
        
        guard let urlRequest = try? endpoint.asURLRequest() else {
            completion(.failure(.invalidURL))
            return
        }
        
        let dataRequest = AF.request(urlRequest)
        dataRequest.responseDecodable(of: ServerResponse<T>.self, queue: .global(qos: .background)) { [weak self] dataResponse in
            switch dataResponse.result {
            case .success(let serverResponse):
                completion(.success(serverResponse))
            case .failure(let error):
                self?.handleError(error, completion: completion)
            }
        }
    }
    
    private func handleError<T: Codable>(_ error: AFError, completion: @escaping NetworkResponse<T>) {
        if error.isResponseSerializationError {
            completion(.failure(.responseSerializacion))
        } else if error.isInvalidURLError {
            completion(.failure(.invalidURL))
        } else if let urlError = error.underlyingError as? URLError {
            switch urlError.code {
            case .notConnectedToInternet:
                completion(.failure(.noInternetConnection))
            default:
                completion(.failure(.unhandledError))
            }
        } else {
            completion(.failure(.unhandledError))
        }
    }
}
