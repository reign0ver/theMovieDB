//
//  GetMovieDetailInteractor.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

import RxSwift

public final class GetMovieDetailInteractor: SingleInteractor<ShowDetailParams, ShowDetail> {
    private let moviesRepository: MovieRepositoryType
    
    public init(_ moviesRepository: MovieRepositoryType) {
        self.moviesRepository = moviesRepository
    }
    
    public override func buildUseCase(params: ShowDetailParams) -> Single<ShowDetail> {
        return moviesRepository.getMovieDetail(params: params)
    }
}
