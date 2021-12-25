//
//  HTTPMethod.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 24/12/21.
//

enum HTTPMethod: String {
    case get
    case post
    
    var value: String { return rawValue.uppercased() }
}
