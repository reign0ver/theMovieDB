//
//  TVShowEndpoints.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import Foundation

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
