//
//  TVShowRemoteDataSource.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 24/12/21.
//

import RxSwift
import Domain

protocol TVShowRemoteDataSourceType {
    func getPopularTVShows(endpoint: EndpointType) -> Single<ServerResponse<TVShowModel>>
    func getTopRatedTVShows(endpoint: EndpointType) -> Single<ServerResponse<TVShowModel>>
}

final class TVShowRemoteDataSource: TVShowRemoteDataSourceType {
    
    private let client: HTTPClientType
    
    init(client: HTTPClientType) {
        self.client = client
    }
    
    func getPopularTVShows(endpoint: EndpointType) -> Single<ServerResponse<TVShowModel>> {
        return client.sendRequest(endpoint, of: TVShowModel.self)
    }
    
    func getTopRatedTVShows(endpoint: EndpointType) -> Single<ServerResponse<TVShowModel>> {
        return client.sendRequest(endpoint, of: TVShowModel.self)
    }
}
