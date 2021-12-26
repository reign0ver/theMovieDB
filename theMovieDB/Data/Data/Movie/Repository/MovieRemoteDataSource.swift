//
//  MovieRemoteDataSource.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

protocol MovieRemoteDataSourceType {
    func getPopularMovies(endpoint: EndpointType) -> Single<ServerResponse<APIMovie>>
    func getTopRatedMovies(endpoint: EndpointType) -> Single<ServerResponse<APIMovie>>
    func getUpcomingMovies(endpoint: EndpointType) -> Single<ServerResponse<APIMovie>>
}

final class MovieRemoteDataSource: MovieRemoteDataSourceType {
    private let client: HTTPClientType
    
    init(client: HTTPClientType = HTTPClient()) {
        self.client = client
    }
    
    func getPopularMovies(endpoint: EndpointType) -> Single<ServerResponse<APIMovie>> {
        return client.sendRequest(endpoint, of: APIMovie.self)
    }
    
    func getTopRatedMovies(endpoint: EndpointType) -> Single<ServerResponse<APIMovie>> {
        return client.sendRequest(endpoint, of: APIMovie.self)
    }
    
    func getUpcomingMovies(endpoint: EndpointType) -> Single<ServerResponse<APIMovie>> {
        return client.sendRequest(endpoint, of: APIMovie.self)
    }
}
