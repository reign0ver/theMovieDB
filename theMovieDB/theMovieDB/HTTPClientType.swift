//
//  HTTPClient.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import Foundation

typealias NetworkResponse<T: Codable> = (Swift.Result<ServerResponse<T>, NetworkError>) -> Void

protocol HTTPClientType {
    func sendRequest<T: Codable>(_ endpoint: EndpointType, of: T.Type, completion: @escaping (Swift.Result<ServerResponse<T>, NetworkError>) -> Void)
}

enum NetworkError: Swift.Error {
    case invalidURL
    case responseSerializacion
    case noInternetConnection
    case unhandledError
}
