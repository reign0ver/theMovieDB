//
//  MoviesEndpoints.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import Alamofire
import Domain

enum MoviesEndpoints: EndpointType {
    case popular(ShowParams)
    case topRated(ShowParams)
    case upcoming(ShowParams)
    case detail(id: Int)
    
    var path: String {
        switch self {
        case .popular:
            return "/movie/popular"
        case .topRated:
            return "/movie/top_rated"
        case .upcoming:
            return "/movie/upcoming"
        case let .detail(id):
            return "/movie/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .popular, .topRated, .upcoming, .detail:
            return .get
        }
    }
    
    var params: Parameters? {
        var params = ["api_key": NetworkConstants.apiKey]
        switch self {
        case let .popular(movieParams),
             let .topRated(movieParams),
             let .upcoming(movieParams):
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
