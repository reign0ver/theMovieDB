//
//  GetUpcomingMoviesInteractor.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

public final class GetUpcomingMoviesInteractor: SingleInteractor<MovieParams, [Movie]> {
    private let moviesRepository: MovieRepositoryType
    
    public init(moviesRepository: MovieRepositoryType) {
        self.moviesRepository = moviesRepository
    }
    
    public override func buildUseCase(params: MovieParams) -> Single<[Movie]> {
        return moviesRepository.getUpcomingMovies(params: params)
    }
}