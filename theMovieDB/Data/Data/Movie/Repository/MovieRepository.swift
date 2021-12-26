//
//  MovieRepository.swift
//  Data
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift
import Domain

final class MovieRepository: MovieRepositoryType {
    private let remoteDataSource: MovieRemoteDataSourceType
    
    init(remoteDataSource: MovieRemoteDataSourceType = MovieRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getPopularMovies(params: MovieParams) -> Single<[Movie]> { // TODO: How to avoid nested maps if we can
        return remoteDataSource
            .getPopularMovies(endpoint: MoviesEndpoints.popular(params))
            .map { $0.results.map { $0.movie } }
    }
    
    func getTopRatedMovies(params: MovieParams) -> Single<[Movie]> {
        return remoteDataSource
            .getPopularMovies(endpoint: MoviesEndpoints.topRated(params))
            .map { $0.results.map { $0.movie } }
    }
    
    func getUpcomingMovies(params: MovieParams) -> Single<[Movie]> {
        return remoteDataSource
            .getPopularMovies(endpoint: MoviesEndpoints.upcoming(params))
            .map { $0.results.map { $0.movie } }
    }
}

public let movieRepository: MovieRepositoryType = MovieRepository()

public protocol DataDependencies {}

extension DataDependencies {
    static func inject() -> MovieRepositoryType {
        return MovieRepository()
    }
}
