//
//  MovieRepositoryType.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

public protocol MovieRepositoryType {
    // TODO: Pending to define the parameters the domain layer is going to receive
    func getPopularMovies(endpoint: String) -> Single<[Movie]>
    func getTopRatedMovies(endpoint: String) -> Single<[Movie]>
    func getUpcomingMovies(endpoint: String) -> Single<[Movie]>
}
