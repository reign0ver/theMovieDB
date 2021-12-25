//
//  MovieRepositoryType.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

public protocol MovieRepositoryType {
    // TODO: Pending to define the parameters the domain layer is going to receive
    func getPopularMovies(params: MovieParams) -> Single<[Movie]>
    func getTopRatedMovies(params: MovieParams) -> Single<[Movie]>
    func getUpcomingMovies(params: MovieParams) -> Single<[Movie]>
}
