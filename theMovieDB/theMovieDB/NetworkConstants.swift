//
//  NetworkConstants.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import Foundation

struct NetworkConstants {
    static let baseURL = "https://api.themoviedb.org/3"
    static let apiKey = "4a7aa5d9cec4625df8e4ff64ee86288f"
    static let imageURL = "https://image.tmdb.org/t/p/w500"
}

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
}

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
}

protocol EndpointType {
    var baseURL: String { get }
    var path: String { get }
}

extension EndpointType {
    var baseURL: String {
        return NetworkConstants.baseURL
    }
}
