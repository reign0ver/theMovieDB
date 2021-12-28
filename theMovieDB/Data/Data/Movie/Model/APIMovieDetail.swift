//
//  APIMovieDetail.swift
//  Data
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

import Domain

public struct APIMovieDetail: Codable {
    public let title: String
    public let releaseDate: String
    public let overview: String
    public let backdropPath: String?
    public let voteAverage: Double
    public let genres: [APIGenre]
    
    private enum CodingKeys: String, CodingKey {
        case title
        case releaseDate = "release_date"
        case overview
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case genres
    }
}

public struct APIGenre: Codable {
    public let name: String
}

public extension APIMovieDetail {
    var movieDetail: ShowDetail {
        return MovieDetail(
            title: title, 
            releaseDate: releaseDate, 
            overview: overview, 
            imageURL: "\(NetworkConstants.imageURL)\(backdropPath ?? "")", 
            voteAverage: "\(voteAverage)", 
            genres: genres.map { $0.name }
        )
    }
}
