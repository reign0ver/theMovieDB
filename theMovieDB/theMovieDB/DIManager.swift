//
//  DIManager.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 29/12/21.
//

import Domain
import Data

public protocol MVVMViewModelDependencies: DataDependencies {}

/// Every ViewModel should conform this protocol
public protocol MVVMViewModel {
    associatedtype Dependencies: MVVMViewModelDependencies
}

public extension MVVMViewModelDependencies {
    static func injectGetMovieDetailInteractor() -> SingleInteractor<ShowDetailParams, ShowDetail> {
        return GetMovieDetailInteractor(moviesRepository: injectMovieRepository())
    }
    
    static func injectGetTVShowDetailInteractor() -> SingleInteractor<ShowDetailParams, ShowDetail> {
        return GetTVShowDetailInteractor(tvShowsRepository: injectTVShowRepository())
    }
    
    static func injectGetTopRatedMoviesInteractor() -> SingleInteractor<ShowParams, [Movie]> {
        return GetTopRatedMoviesInteractor(moviesRepository: injectMovieRepository())
    }
    
    static func injectGetUpcomingMoviesInteractor() -> SingleInteractor<ShowParams, [Movie]> {
        return GetUpcomingMoviesInteractor(moviesRepository: injectMovieRepository())
    }
    
    static func injectGetPopularMoviesInteractor() -> SingleInteractor<ShowParams, [Movie]> {
        return GetPopularMoviesInteractor(moviesRepository: injectMovieRepository())
    }
    
    static func injectGetPopularTVShowsInteractor() -> SingleInteractor<ShowParams, [TVShow]> {
        return GetPopularTVShowsInteractor(tvShowsRepository: injectTVShowRepository())
    }
    
    static func injectGetTopRatedTVShowsInteractor() -> SingleInteractor<ShowParams, [TVShow]> {
        return GetTopRatedTVShowsInteractor(tvShowsRepository: injectTVShowRepository())
    }
}
