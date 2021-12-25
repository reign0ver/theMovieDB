//
//  TVShowModel.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 24/12/21.
//

import Foundation

public struct TVShowModel: Codable {
    let id: Int
    let name: String
    let firstAirDate: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let voteAverage: Double
    let originCountry: [String]
    let genreIDs: [Int]
    let originalLanguage: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name
        case firstAirDate = "first_air_date"
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case originCountry = "origin_country"
        case genreIDs = "genre_ids"
        case originalLanguage = "original_language"
    }
}
