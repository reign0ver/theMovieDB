//
//  APITVShowDetail.swift
//  Data
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

import Domain

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

public extension APITVShowDetail {
    var tvShowDetail: ShowDetail {
        return TVShowDetail(
            title: name, 
            releaseDate: firstAirDate, 
            overview: overview, 
            imageURL: "\(NetworkConstants.imageURL)\(backdropPath ?? "")", 
            voteAverage: "\(voteAverage)", 
            genres: genres.map { $0.name }
        )
    }
}
