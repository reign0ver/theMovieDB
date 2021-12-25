//
//  TVShowEndpoints.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

enum TVShowEndpoints: EndpointType {
    case popular
    case topRated
    
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
    
    var params: String? { return nil }
}
