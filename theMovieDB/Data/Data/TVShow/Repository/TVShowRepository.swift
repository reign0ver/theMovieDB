//
//  TVShowRepository.swift
//  Data
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift
import Domain

final class TVShowRepository: TVShowRepositoryType {    
    private let remoteDataSource: TVShowRemoteDataSourceType
    
    init(remoteDataSource: TVShowRemoteDataSourceType = TVShowRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getPopularTVShows(params: ShowParams) -> Single<[TVShow]> {
        return remoteDataSource
            .getPopularTVShows(endpoint: TVShowEndpoints.popular(params))
            .map { $0.results.map { $0.tvShow } }
    }
    
    func getTopRatedTVShows(params: ShowParams) -> Single<[TVShow]> {
        return remoteDataSource
            .getTopRatedTVShows(endpoint: TVShowEndpoints.topRated(params))
            .map { $0.results.map { $0.tvShow } }
    }
    
    func getTVShowDetail(params: ShowDetailParams) -> Single<ShowDetail> {
        return remoteDataSource
            .getTVShowDetail(endpoint: TVShowEndpoints.detail(id: params.showId))
            .map { $0.tvShowDetail }
    }
}

public let tvShowRepository: TVShowRepositoryType = TVShowRepository()
