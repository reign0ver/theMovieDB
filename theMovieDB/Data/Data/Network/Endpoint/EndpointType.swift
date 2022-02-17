//
//  EndpointType.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import Alamofire

protocol EndpointType: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var params: [String: Any]? { get }
    var encoder: ParameterEncoding { get }
}

extension EndpointType {
    var baseURL: String {
        return NetworkConstants.baseURL
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL().appendingPathComponent(path)
        var urlRequest = try URLRequest(url: url, method: httpMethod)
        urlRequest.timeoutInterval = 20
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest = try encoder.encode(urlRequest, with: params)
        
        return urlRequest
    }
}
