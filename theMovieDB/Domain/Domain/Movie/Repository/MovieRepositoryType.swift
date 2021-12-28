//
//  MovieRepositoryType.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

public protocol MovieRepositoryType {
    func getPopularMovies(params: MovieParams) -> Single<[Movie]>
    func getTopRatedMovies(params: MovieParams) -> Single<[Movie]>
    func getUpcomingMovies(params: MovieParams) -> Single<[Movie]>
    func getMovieDetail() -> Single<ShowDetail>
}
