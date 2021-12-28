//
//  ShowDetailViewModel.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

import Data
import Domain
import RxSwift
import RxRelay

final class ShowDetailViewModel: ShowDetailViewModelType {
    private let disposeBag = DisposeBag()
    private let dependencies: Dependencies
    private let viewStateRelay = PublishRelay<ShowDetailViewState>()
    private let params: ShowDetailCoordinatorParams
    
    init(dependencies: Dependencies = .init(), params: ShowDetailCoordinatorParams) {
        self.dependencies = dependencies
        self.params = params
    }
    
    func getViewStateObservable() -> Observable<ShowDetailViewState> {
        return viewStateRelay.asObservable()
    }
    
    func getShowDetail() {
        if params.showType.isMovie {
            getMovieDetail(with: params.showId)
            return
        }
        
        if params.showType.isTVShow {
            getTVShowDetail(with: params.showId)
            return
        }
    }
}

private extension ShowDetailViewModel {
    func getMovieDetail(with id: Int) {
        dependencies
            .getMovieDetailInteractor
            .execute(params: ShowDetailParams(showId: id)) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case let .success(movieDetail):
                    self.viewStateRelay.accept(.showDetail(movieDetail))
                case let .failure(error):
                    print(error)
                }
            }.disposed(by: disposeBag)
    }
    
    func getTVShowDetail(with id: Int) {
        dependencies
            .getTVShowDetailInteractor
            .execute(params: ShowDetailParams(showId: id)) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case let .success(tvShowDetail):
                    self.viewStateRelay.accept(.showDetail(tvShowDetail))
                case let .failure(error):
                    print(error)
                }
            }.disposed(by: disposeBag)
    }
}

extension ShowDetailViewModel {
    struct Dependencies {
        let getMovieDetailInteractor: SingleInteractor<ShowDetailParams, ShowDetail>
        let getTVShowDetailInteractor: SingleInteractor<ShowDetailParams, ShowDetail>
        
        init(_ getMovieDetailInteractor: SingleInteractor<ShowDetailParams, ShowDetail> = GetMovieDetailInteractor(movieRepository),
             _ getTVShowDetailInteractor: SingleInteractor<ShowDetailParams, ShowDetail> = GetTVShowDetailInteractor(tvShowsRepository: tvShowRepository)) {
            self.getMovieDetailInteractor = getMovieDetailInteractor
            self.getTVShowDetailInteractor = getTVShowDetailInteractor
        }
    }
}
