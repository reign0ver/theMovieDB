//
//  ShowViewModel.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 26/12/21.
//

import Data
import Domain
import RxSwift
import RxRelay

final class ShowViewModel: ShowViewModelType {
    private let disposeBag = DisposeBag()
    private let dependencies: Dependencies
    private let viewStateRelay = PublishRelay<ShowViewState>()
    
    private let dispatchQueue = DispatchQueue(label: "theMovieDB.synchronizeWritingEvents", attributes: .concurrent, target: .main)
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
    
    func getViewStateObservable() -> Observable<ShowViewState> {
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

private extension ShowViewModel {
    func getPopularMovies() {
        dependencies
            .getPopularMoviesInteractor
            .execute(params: ShowParams(page: 1)) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case let .success(popularMovies):
                    self.dispatchQueue.async(flags: .barrier) {
                        self.viewStateRelay.accept(.showShows(.popularMovies, popularMovies.map { $0.show }))
                    }
                case let .failure(error):
                    print(error)
                }
            }.disposed(by: disposeBag)
    }
    
    func getTopRatedMovies() {
        dependencies
            .getTopRatedMoviesInteractor
            .execute(params: ShowParams(page: 1)) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case let .success(topRatedMovies):
                    self.dispatchQueue.async(flags: .barrier) {
                        self.viewStateRelay.accept(.showShows(.topRatedMovies, topRatedMovies.map { $0.show }))
                    }
                case let .failure(error):
                    print(error)
                }
            }.disposed(by: disposeBag)
    }
    
    func getUpcomingMovies() {
        dependencies
            .getUpcomingMoviesInteractor
            .execute(params: ShowParams(page: 1)) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case let .success(topRatedMovies):
                    self.dispatchQueue.async(flags: .barrier) {
                        self.viewStateRelay.accept(.showShows(.upcomingMovies, topRatedMovies.map { $0.show }))
                    }
                case let .failure(error):
                    print(error)
                }
            }.disposed(by: disposeBag)
    }
    
    func getPopularTVShows() {
        dependencies
            .getPopularTVShowsInteractor
            .execute(params: ShowParams(page: 1)) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case let .success(popularTVShows):
                    self.dispatchQueue.async(flags: .barrier) {
                        self.viewStateRelay.accept(.showShows(.popularTVShows, popularTVShows.map { $0.show }))
                    }
                case let .failure(error):
                    print(error)
                }
            }.disposed(by: disposeBag)
    }
    
    func getTopRatedTVShows() {
        dependencies
            .getTopRatedTVShowsInteractor
            .execute(params: ShowParams(page: 1)) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case let .success(topRatedTVShows):
                    self.dispatchQueue.async(flags: .barrier) {
                        self.viewStateRelay.accept(.showShows(.topRatedTVShows, topRatedTVShows.map { $0.show }))
                    }
                case let .failure(error):
                    print(error)
                }
            }.disposed(by: disposeBag)
    }
}

extension ShowViewModel: MVVMViewModel {
    struct Dependencies: MVVMViewModelDependencies {
        let getPopularMoviesInteractor: SingleInteractor<ShowParams, [Movie]>
        let getTopRatedMoviesInteractor: SingleInteractor<ShowParams, [Movie]>
        let getUpcomingMoviesInteractor: SingleInteractor<ShowParams, [Movie]>
        
        let getPopularTVShowsInteractor: SingleInteractor<ShowParams, [TVShow]>
        let getTopRatedTVShowsInteractor: SingleInteractor<ShowParams, [TVShow]>
        
        init(_ getPopularMoviesInteractor: SingleInteractor<ShowParams, [Movie]> = injectGetPopularMoviesInteractor(),
             _ getTopRatedMoviesInteractor: SingleInteractor<ShowParams, [Movie]> = injectGetTopRatedMoviesInteractor(),
             _ getUpcomingMoviesInteractor: SingleInteractor<ShowParams, [Movie]> = injectGetUpcomingMoviesInteractor(),
             _ getPopularTVShowsInteractor: SingleInteractor<ShowParams, [TVShow]> = injectGetPopularTVShowsInteractor(),
             _ getTopRatedTVShowsInteractor: SingleInteractor<ShowParams, [TVShow]> = injectGetTopRatedTVShowsInteractor()
        ) {
            self.getPopularMoviesInteractor = getPopularMoviesInteractor
            self.getTopRatedMoviesInteractor = getTopRatedMoviesInteractor
            self.getUpcomingMoviesInteractor = getUpcomingMoviesInteractor
            self.getPopularTVShowsInteractor = getPopularTVShowsInteractor
            self.getTopRatedTVShowsInteractor = getTopRatedTVShowsInteractor
        }
    }
}
