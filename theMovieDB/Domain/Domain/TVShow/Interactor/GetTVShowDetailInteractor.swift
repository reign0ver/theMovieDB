//
//  GetTVShowDetailInteractor.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

import RxSwift

public final class GetTVShowDetailInteractor: SingleInteractor<ShowDetailParams, ShowDetail> {
    private let tvShowsRepository: TVShowRepositoryType
    
    public init(tvShowsRepository: TVShowRepositoryType) {
        self.tvShowsRepository = tvShowsRepository
    }
    
    public override func buildUseCase(params: ShowDetailParams) -> Single<ShowDetail> {
        return tvShowsRepository.getTVShowDetail(params: params)
    }
}
