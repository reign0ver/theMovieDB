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
    var params: String? { get } // check this type
}

extension EndpointType {
    var baseURL: String {
        return NetworkConstants.baseURL
    }
    
    func asURLRequest() throws -> URLRequest {
        var url = try baseURL.asURL()
        url.appendPathComponent(path)
        
        var urlRequest = URLRequest(
            url: url, 
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, 
            timeoutInterval: 20
        )
        
        urlRequest.httpMethod = httpMethod.value
        // TODO: Pending to add logic to encode parameters
        
        return URLRequest(url: URL(string: "")!)
    }
}
