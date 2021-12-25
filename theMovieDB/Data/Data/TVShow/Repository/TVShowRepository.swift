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
    
    init(remoteDataSource: TVShowRemoteDataSourceType) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getPopularTVShows(endpoint: String) -> Single<[TVShow]> {
        return remoteDataSource
            .getPopularTVShows(endpoint: TVShowEndpoints.popular)
            .map { $0.results.map { $0.tvShow } }
    }
    
    func getTopRatedTVShows(endpoint: String) -> Single<[TVShow]> {
        return remoteDataSource
            .getTopRatedTVShows(endpoint: TVShowEndpoints.topRated)
            .map { $0.results.map { $0.tvShow } }
    }
    
}
