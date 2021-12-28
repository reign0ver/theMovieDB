//
//  GetPopularTVShowsInteractor.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

public final class GetPopularTVShowsInteractor: SingleInteractor<ShowParams, [TVShow]> {
    private let tvShowsRepository: TVShowRepositoryType
    
    public init(_ tvShowsRepository: TVShowRepositoryType) {
        self.tvShowsRepository = tvShowsRepository
    }
    
    public override func buildUseCase(params: ShowParams) -> Single<[TVShow]> {
        return tvShowsRepository.getPopularTVShows(params: params)
    }
}
