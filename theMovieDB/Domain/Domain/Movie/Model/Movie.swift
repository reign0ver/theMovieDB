//
//  Movie.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

public struct Movie {
    public let title: String
    public let releaseDate: String
    public let voteAverage: String
    public let imageURL: String
    
    public init(title: String, releaseDate: String, voteAverage: String, imageURL: String) {
        self.title = title
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
        self.imageURL = imageURL
    }
}
