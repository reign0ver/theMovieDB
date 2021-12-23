//
//  HTTPClient.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Codable>(url: String, of: T.Type)
}
