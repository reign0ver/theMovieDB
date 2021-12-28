//
//  MovieRepositoryType.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

public protocol MovieRepositoryType {
    func getPopularMovies(params: ShowParams) -> Single<[Movie]>
    func getTopRatedMovies(params: ShowParams) -> Single<[Movie]>
    func getUpcomingMovies(params: ShowParams) -> Single<[Movie]>
    func getMovieDetail(params: ShowDetailParams) -> Single<ShowDetail>
}
