//
//  APITVShowDetail.swift
//  Data
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

public struct APITVShowDetail: Codable {
    public let name: String
    public let firstAirDate: String
    public let overview: String
    public let backdropPath: String?
    public let voteAverage: Double
    public let genres: [APIGenre]
    
    private enum CodingKeys: String, CodingKey {
        case name
        case firstAirDate = "first_air_date"
        case overview
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case genres
    }
}
