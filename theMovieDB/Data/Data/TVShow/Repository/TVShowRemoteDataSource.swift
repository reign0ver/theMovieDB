//
//  TVShowRemoteDataSource.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 24/12/21.
//

import RxSwift

protocol TVShowRemoteDataSourceType {
    func getPopularTVShows(endpoint: EndpointType) -> Single<ServerResponse<APITVShow>>
    func getTopRatedTVShows(endpoint: EndpointType) -> Single<ServerResponse<APITVShow>>
}

final class TVShowRemoteDataSource: TVShowRemoteDataSourceType {
    
    private let client: HTTPClientType
    
    init(client: HTTPClientType = HTTPClient()) {
        self.client = client
    }
    
    func getPopularTVShows(endpoint: EndpointType) -> Single<ServerResponse<APITVShow>> {
        return client.sendRequest(endpoint, of: APITVShow.self)
    }
    
    func getTopRatedTVShows(endpoint: EndpointType) -> Single<ServerResponse<APITVShow>> {
        return client.sendRequest(endpoint, of: APITVShow.self)
    }
}
