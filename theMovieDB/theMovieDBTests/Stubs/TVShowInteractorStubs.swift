//
//  TVShowInteractorStubs.swift
//  theMovieDBTests
//
//  Created by Andres Enrique Carrillo Miranda on 28/12/21.
//

import Domain

final class GetPopularTVShowsInteractorStub: SingleInteractorStub<ShowParams, [TVShow]> {}

final class GetTopRatedTopRatedInteractorStub: SingleInteractorStub<ShowParams, [TVShow]> {}

final class GetTVShowDetailsInteractorStub: SingleInteractorStub<ShowDetailParams, ShowDetail> {}
