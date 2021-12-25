//
//  ServerResponse.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 24/12/21.
//

import Foundation

public struct ServerResponse<T: Codable>: Codable {
    let page: Int
    let results: [T]
    let totalResults: Int
    let totalPages: Int
    
    private enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
