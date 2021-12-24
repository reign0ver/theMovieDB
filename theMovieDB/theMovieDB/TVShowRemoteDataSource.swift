//
//  TVShowRemoteDataSource.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 24/12/21.
//

import Foundation

final class TVShowRemoteDataSource {
    
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getPopularTVShows(endpoint: EndpointType, completion: @escaping (Swift.Result<ServerResponse<TVShowModel>, Error>) -> Void) {
        
    }
    
    func getTopRatedTVShows(endpoint: EndpointType, completion: @escaping (Swift.Result<ServerResponse<TVShowModel>, Error>) -> Void) {
        
    }
    
}
