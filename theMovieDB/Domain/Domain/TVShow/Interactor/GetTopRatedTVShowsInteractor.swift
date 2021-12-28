//
//  GetTopRatedTVShowsInteractor.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

public final class GetTopRatedTVShowsInteractor: SingleInteractor<ShowParams, [TVShow]> {
    private let tvShowsRepository: TVShowRepositoryType
    
    public init(_ tvShowsRepository: TVShowRepositoryType) {
        self.tvShowsRepository = tvShowsRepository
    }
    
    public override func buildUseCase(params: ShowParams) -> Single<[TVShow]> {
        return tvShowsRepository.getTopRatedTVShows(params: params)
    }
}
