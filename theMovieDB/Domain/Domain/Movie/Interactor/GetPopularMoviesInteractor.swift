//
//  GetPopularMoviesInteractor.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

public final class GetPopularMoviesInteractor: SingleInteractor<MovieParams, [Movie]> {
    private let moviesRepository: MovieRepositoryType
    
    public init(_ moviesRepository: MovieRepositoryType) {
        self.moviesRepository = moviesRepository
    }
    
    public override func buildUseCase(params: MovieParams) -> Single<[Movie]> {
        return moviesRepository.getPopularMovies(params: params)
    }
}

// TODO: Check if is the same for every category
public struct MovieParams {
    public let page: Int
    
    public init(page: Int) {
        self.page = page
    }
}
