//
//  TVShow.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import Foundation

public struct TVShow {
    public let id: Int
    public let title: String
    public let firstAirDate: String
    public let voteAverage: String
    public let imageURL: String
    
    public init(id: Int, title: String, firstAirDate: String, voteAverage: String, imageURL: String) {
        self.id = id
        self.title = title
        self.firstAirDate = firstAirDate
        self.voteAverage = voteAverage
        self.imageURL = imageURL
    }
}

public extension TVShow {
    var show: Show {
        return Show(
            id: id, 
            imageURL: imageURL
        )
    }
}
