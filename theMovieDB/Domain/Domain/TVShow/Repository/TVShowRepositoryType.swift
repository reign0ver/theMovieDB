//
//  TVShowRepositoryType.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

public protocol TVShowRepositoryType {
    func getPopularTVShows(params: ShowParams) -> Single<[TVShow]>
    func getTopRatedTVShows(params: ShowParams) -> Single<[TVShow]>
    func getTVShowDetail(params: ShowDetailParams) -> Single<ShowDetail>
}
