//
//  MovieModel.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 24/12/21.
//

import Foundation

public struct MovieModel: Codable {
    let id: Int
    let title: String
    let releaseDate: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let voteAverage: Double
    let adult: Bool
    let genreIDs: [Int]
    let video: Bool
    let originalLanguage: String
    
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
