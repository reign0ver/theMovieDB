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
    
    func getMovies()
}

enum MoviesViewState {
    case showMovies
    case showError
    case showLoading
    case hideLoading
}



final class MoviesViewModel {
    private let disposeBag = DisposeBag()
    private let viewStateRelay = PublishRelay<MoviesViewState>()
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
}

extension MoviesViewModel: MoviesViewModelType {
    func getViewStateObservable() -> Observable<MoviesViewState> {
        return viewStateRelay.asObservable()
    }
    
    func getMovies() {
        dependencies
            .getPopularMoviesInteractor
            .execute(params: MovieParams(page: 1)) { result in
                switch result {
                case let .success(popularMovies):
                    print(popularMovies)
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
        
        init(_ getPopularMoviesInteractor: SingleInteractor<MovieParams, [Movie]> = GetPopularMoviesInteractor(movieRepository),
             _ getTopRatedMoviesInteractor: SingleInteractor<MovieParams, [Movie]> = GetTopRatedMoviesInteractor(movieRepository),
             _ getUpcomingMoviesInteractor: SingleInteractor<MovieParams, [Movie]> = GetUpcomingMoviesInteractor(movieRepository)) {
            self.getPopularMoviesInteractor = getPopularMoviesInteractor
            self.getTopRatedMoviesInteractor = getTopRatedMoviesInteractor
            self.getUpcomingMoviesInteractor = getUpcomingMoviesInteractor
        }
    }
}
