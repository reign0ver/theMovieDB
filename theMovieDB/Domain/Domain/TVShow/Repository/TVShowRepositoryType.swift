//
//  TVShowRepositoryType.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

public protocol TVShowRepositoryType {
    func getPopularTVShows(endpoint: String) -> Single<[TVShow]>
    func getTopRatedTVShows(endpoint: String) -> Single<[TVShow]>
}
