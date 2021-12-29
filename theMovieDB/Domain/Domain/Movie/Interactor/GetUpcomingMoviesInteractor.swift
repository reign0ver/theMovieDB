//
//  GetUpcomingMoviesInteractor.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

public final class GetUpcomingMoviesInteractor: SingleInteractor<ShowParams, [Movie]> {
    private let moviesRepository: MovieRepositoryType
    
    public init(moviesRepository: MovieRepositoryType) {
        self.moviesRepository = moviesRepository
    }
    
    public override func buildUseCase(params: ShowParams) -> Single<[Movie]> {
        return moviesRepository.getUpcomingMovies(params: params)
    }
}
