//
//  Movie.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

public struct Movie {
    public let id: Int
    public let title: String
    public let releaseDate: String
    public let voteAverage: String
    public let imageURL: String
    
    public init(id: Int, title: String, releaseDate: String, voteAverage: String, imageURL: String) {
        self.id = id
        self.title = title
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
        self.imageURL = imageURL
    }
}

public extension Movie {
    var show: Show {
        return Show(
            id: id, 
            imageURL: imageURL
        )
    }
}
