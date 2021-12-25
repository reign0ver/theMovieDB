//
//  APITVShow.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 24/12/21.
//

public struct APITVShow: Codable {
    public let id: Int
    public let name: String
    public let firstAirDate: String
    public let overview: String
    public let posterPath: String?
    public let backdropPath: String?
    public let voteAverage: Double
    public let originCountry: [String]
    public let genreIDs: [Int]
    public let originalLanguage: String
    
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
