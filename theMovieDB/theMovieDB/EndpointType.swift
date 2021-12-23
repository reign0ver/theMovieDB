//
//  EndpointType.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import Foundation

protocol EndpointType {
    var baseURL: String { get }
    var path: String { get }
}

extension EndpointType {
    var baseURL: String {
        return NetworkConstants.baseURL
    }
}
