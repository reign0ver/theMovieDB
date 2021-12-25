//
//  HTTPClient.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import RxSwift
import Domain

protocol HTTPClientType {
    func sendRequest<T: Codable>(_ endpoint: EndpointType, of: T.Type) -> Single<ServerResponse<T>>
}

enum NetworkError: Swift.Error {
    case invalidURL
    case responseSerializacion
    case noInternetConnection
    case unhandledError
}
