//
//  MovieRemoteDataSource.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift
import Domain

protocol MovieRemoteDataSourceType {
    func getPopularMovies(endpoint: EndpointType) -> Single<ServerResponse<MovieModel>>
    func getTopRatedMovies(endpoint: EndpointType) -> Single<ServerResponse<MovieModel>>
    func getUpcomingMovies(endpoint: EndpointType) -> Single<ServerResponse<MovieModel>>
}

final class MovieRemoteDataSource: MovieRemoteDataSourceType {
    private let client: HTTPClientType
    
    init(client: HTTPClientType) {
        self.client = client
    }
    
    func getPopularMovies(endpoint: EndpointType) -> Single<ServerResponse<MovieModel>> {
        return client.sendRequest(endpoint, of: MovieModel.self)
    }
    
    func getTopRatedMovies(endpoint: EndpointType) -> Single<ServerResponse<MovieModel>> {
        return client.sendRequest(endpoint, of: MovieModel.self)
    }
    
    func getUpcomingMovies(endpoint: EndpointType) -> Single<ServerResponse<MovieModel>> {
        return client.sendRequest(endpoint, of: MovieModel.self)
    }
}
