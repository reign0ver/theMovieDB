//
//  GetPopularTVShowsInteractor.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

public final class GetPopularTVShowsInteractor: SingleInteractor<TVShowParams, [TVShow]> {
    private let tvShowsRepository: TVShowRepositoryType
    
    public init(tvShowsRepository: TVShowRepositoryType) {
        self.tvShowsRepository = tvShowsRepository
    }
    
    public override func buildUseCase(params: TVShowParams) -> Single<[TVShow]> {
        return tvShowsRepository.getPopularTVShows(params: params)
    }
}

// TODO: Check if is the same for every category
public struct TVShowParams {
    public let page: Int
    
    public init(page: Int) {
        self.page = page
    }
}

