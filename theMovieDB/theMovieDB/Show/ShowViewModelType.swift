//
//  ShowViewModelType.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

import Domain
import RxSwift

protocol ShowViewModelType {
    func getViewStateObservable() -> Observable<ShowViewState>
    func getShows()
}

enum ShowViewState {
    case showShows(ShowCategory, [Show])
    case showError
}
