//
//  TVShowEndpoints.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import Alamofire
import Domain

enum TVShowEndpoints: EndpointType {
    case popular(ShowParams)
    case topRated(ShowParams)
    case detail(id: Int)
    
    var path: String {
        switch self {
        case .popular:
            return "/tv/popular"
        case .topRated:
            return "/tv/top_rated"
        case let .detail(id):
            return "/tv/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .popular, .topRated, .detail:
            return .get
        }
    }
    
    var params: Parameters? {
        var params = ["api_key": NetworkConstants.apiKey]
        switch self {
        case let .popular(movieParams),
             let .topRated(movieParams):
            params["page"] = "\(movieParams.page)"
        case .detail: 
            break
        }
        
        return params
    }
    
    var encoder: ParameterEncoding {
        return URLEncoding(destination: .queryString)
    }
}
