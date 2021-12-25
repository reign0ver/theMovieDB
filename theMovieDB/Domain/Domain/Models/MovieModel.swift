//
//  MovieModel.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 24/12/21.
//

import Foundation

public struct MovieModel: Codable {
    public let id: Int
    public let title: String
    public let releaseDate: String
    public let overview: String
    public let posterPath: String?
    public let backdropPath: String?
    public let voteAverage: Double
    public let adult: Bool
    public let genreIDs: [Int]
    public let video: Bool
    public let originalLanguage: String
    
    private enum CodingKeys: String, CodingKey {
        case id, title
        case releaseDate = "release_date"
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case adult
        case genreIDs = "genre_ids"
        case video
        case originalLanguage = "original_language"
    }
}
