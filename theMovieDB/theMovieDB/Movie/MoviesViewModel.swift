//
//  MoviesViewModel.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 26/12/21.
//

import RxSwift
import RxRelay
import Domain
import Data

protocol MoviesViewModelType {
    func getViewStateObservable() -> Observable<MoviesViewState>
    
    func getShows()
}

enum MoviesViewState {
    case showShows(ShowCategory, [Show])
    case showError
    case showLoading
    case hideLoading
}


final class MoviesViewModel: MoviesViewModelType {
    private let disposeBag = DisposeBag()
    private let viewStateRelay = PublishRelay<MoviesViewState>()
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
    
    func getViewStateObservable() -> Observable<MoviesViewState> {
        return viewStateRelay.asObservable()
    }
    
    func getShows() {
        getPopularMovies()
        getTopRatedMovies()
        getUpcomingMovies()
        getPopularTVShows()
        getTopRatedTVShows()
    }
}

private extension MoviesViewModel {
    func getPopularMovies() {
        dependencies
            .getPopularMoviesInteractor
            .execute(params: MovieParams(page: 1)) { result in
                switch result {
                case let .success(popularMovies):
                    self.viewStateRelay.accept(.showShows(.popularMovies, popularMovies.map { $0.show }))
                case let .failure(error):
                    print(error)
                }
            }.disposed(by: disposeBag)
    }
    
    func getTopRatedMovies() {
        dependencies
            .getTopRatedMoviesInteractor
            .execute(params: MovieParams(page: 1)) { result in
                switch result {
                case let .success(topRatedMovies):
                    self.viewStateRelay.accept(.showShows(.topRatedMovies, topRatedMovies.map { $0.show }))
                case let .failure(error):
                    print(error)
                }
            }.disposed(by: disposeBag)
    }
    
    func getUpcomingMovies() {
        dependencies
            .getUpcomingMoviesInteractor
            .execute(params: MovieParams(page: 1)) { result in
                switch result {
                case let .success(topRatedMovies):
                    self.viewStateRelay.accept(.showShows(.upcomingMovies, topRatedMovies.map { $0.show }))
                case let .failure(error):
                    print(error)
                }
            }.disposed(by: disposeBag)
    }
    
    func getPopularTVShows() {
        dependencies
            .getPopularTVShowsInteractor
            .execute(params: TVShowParams(page: 1)) { result in
                switch result {
                case let .success(popularTVShows):
                    self.viewStateRelay.accept(.showShows(.popularTVShows, popularTVShows.map { $0.show }))
                case let .failure(error):
                    print(error)
                }
            }.disposed(by: disposeBag)
    }
    
    func getTopRatedTVShows() {
        dependencies
            .getTopRatedTVShowsInteractor
            .execute(params: TVShowParams(page: 1)) { result in
                switch result {
                case let .success(topRatedTVShows):
                    self.viewStateRelay.accept(.showShows(.topRatedTVShows, topRatedTVShows.map { $0.show }))
                case let .failure(error):
                    print(error)
                }
            }.disposed(by: disposeBag)
    }
}

extension MoviesViewModel {
    struct Dependencies {
        let getPopularMoviesInteractor: SingleInteractor<MovieParams, [Movie]>
        let getTopRatedMoviesInteractor: SingleInteractor<MovieParams, [Movie]>
        let getUpcomingMoviesInteractor: SingleInteractor<MovieParams, [Movie]>
        
        let getPopularTVShowsInteractor: SingleInteractor<TVShowParams, [TVShow]>
        let getTopRatedTVShowsInteractor: SingleInteractor<TVShowParams, [TVShow]>
        
        init(_ getPopularMoviesInteractor: SingleInteractor<MovieParams, [Movie]> = GetPopularMoviesInteractor(movieRepository),
             _ getTopRatedMoviesInteractor: SingleInteractor<MovieParams, [Movie]> = GetTopRatedMoviesInteractor(movieRepository),
             _ getUpcomingMoviesInteractor: SingleInteractor<MovieParams, [Movie]> = GetUpcomingMoviesInteractor(movieRepository),
             _ getPopularTVShowsInteractor: SingleInteractor<TVShowParams, [TVShow]> = GetPopularTVShowsInteractor(tvShowsRepository: tvShowRepository),
             _ getTopRatedTVShowsInteractor: SingleInteractor<TVShowParams, [TVShow]> = GetTopRatedTVShowsInteractor(tvShowsRepository: tvShowRepository)) {
            self.getPopularMoviesInteractor = getPopularMoviesInteractor
            self.getTopRatedMoviesInteractor = getTopRatedMoviesInteractor
            self.getUpcomingMoviesInteractor = getUpcomingMoviesInteractor
            self.getPopularTVShowsInteractor = getPopularTVShowsInteractor
            self.getTopRatedTVShowsInteractor = getTopRatedTVShowsInteractor
        }
    }
}
