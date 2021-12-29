//
//  MovieInteractorStubs.swift
//  theMovieDBTests
//
//  Created by Andres Enrique Carrillo Miranda on 28/12/21.
//

import Domain

final class GetPopularMoviesInteractorStub: SingleInteractorStub<ShowParams, [Movie]> {}

final class GetTopRatedMoviesInteractorStub: SingleInteractorStub<ShowParams, [Movie]> {}

final class GetUpcomingMoviesInteractorStub: SingleInteractorStub<ShowParams, [Movie]> {}

final class GetMovieDetailsInteractorStub: SingleInteractorStub<ShowDetailParams, ShowDetail> {}
