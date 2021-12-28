//
//  ShowDetail.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

public protocol ShowDetail {
    var title: String { get set }
    var releaseDate: String { get set}
    var overview: String { get set}
    var imageURL: String { get set}
    var voteAverage: String { get set}
    var genres: [String] { get set}
}
