//
//  TVShowRepositoryType.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

public protocol TVShowRepositoryType {
    func getPopularTVShows(params: String) -> Single<[TVShow]>
    func getTopRatedTVShows(params: String) -> Single<[TVShow]>
}
