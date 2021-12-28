//
//  ShowDetailViewModelType.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

import RxSwift
import Domain

protocol ShowDetailViewModelType {
    func getViewStateObservable() -> Observable<ShowDetailViewState>
    func getShowDetail()
}

enum ShowDetailViewState {
    case showDetail(ShowDetail)
    case showLoading
    case hideLoading
    case showError
}
