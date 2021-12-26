//
//  TVShowEndpoints.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import Alamofire
import Domain

enum TVShowEndpoints: EndpointType {
    case popular(TVShowParams)
    case topRated(TVShowParams)
    
    var path: String {
        switch self {
        case .popular:
            return "/tv/popular"
        case .topRated:
            return "/tv/top_rated"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .popular, .topRated:
            return .get
        }
    }
    
    var params: Parameters? {
        var params = ["api_key": NetworkConstants.apiKey]
        switch self {
        case let .popular(movieParams),
             let .topRated(movieParams):
            params["page"] = "\(movieParams.page)"
        }
        
        return params
    }
    
    var encoder: ParameterEncoding {
        return URLEncoding(destination: .queryString)
    }
}
