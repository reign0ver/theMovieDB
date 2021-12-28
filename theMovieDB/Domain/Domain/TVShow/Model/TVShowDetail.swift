//
//  TVShowDetail.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

public struct TVShowDetail: ShowDetail {
    public var title: String
    public var releaseDate: String
    public var overview: String
    public var imageURL: String
    public var voteAverage: String
    public var genres: [String]
    
    public init(title: String, releaseDate: String, overview: String, imageURL: String, voteAverage: String, genres: [String]) {
        self.title = title
        self.releaseDate = releaseDate
        self.overview = overview
        self.imageURL = imageURL
        self.voteAverage = voteAverage
        self.genres = genres
    }
}
