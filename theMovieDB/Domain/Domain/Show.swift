//
//  Show.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

public struct Show {    
    public let id: Int
    public let imageURL: String
    
    public init(id: Int, imageURL: String) {
        self.id = id
        self.imageURL = imageURL
    }
}

public enum ShowCategory {
    case popularMovies
    case topRatedMovies
    case upcomingMovies
    case popularTVShows
    case topRatedTVShows
    
    public var name: String {
        switch self {
        case .popularMovies:
            return "Popular Movies"
        case .topRatedMovies:
            return "Top Rated Movies"
        case .upcomingMovies:
            return "Upcoming Movies"
        case .popularTVShows:
            return "Popular TV Shows"
        case .topRatedTVShows:
            return "Top Rated TV Shows"
        }
    }
}
