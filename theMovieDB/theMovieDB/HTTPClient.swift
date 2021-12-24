//
//  HTTPClient.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import Foundation

enum NetworkError: Swift.Error {
    case invalidURL
}

protocol HTTPClient {
    func sendRequest<T: Codable>(url: String, of: T.Type, completion: @escaping (Swift.Result<T, NetworkError>) -> Void)
}

final class HTTPClientImpl: HTTPClient { // TODO: Change the name of this class
    
    let sharedSession = URLSession.shared
    
    
    func sendRequest<T: Codable>(url: String, of: T.Type, completion: @escaping (Swift.Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
    }
}
