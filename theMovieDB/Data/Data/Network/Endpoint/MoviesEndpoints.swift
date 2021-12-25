//
//  MoviesEndpoints.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

enum MoviesEndpoints: EndpointType {
    case popular
    case topRated
    case upcoming
    
    var path: String {
        switch self {
        case .popular:
            return "/movie/popular"
        case .topRated:
            return "/movie/top_rated"
        case .upcoming:
            return "/movie/upcoming"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .popular, .topRated, .upcoming:
            return .get
        }
    }
    
    var params: String? { return nil }
}
