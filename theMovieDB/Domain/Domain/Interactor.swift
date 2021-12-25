//
//  Interactor.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 25/12/21.
//

import RxSwift

protocol Interactor {
    associatedtype Params
    associatedtype Response
    
    func execute(params: Params, completion: @escaping (Swift.Result<Response, Error>) -> Void) -> Disposable
}

/// Interactor that conforms the RxSwift SingleObservableType
/// We can create an ObservableInteractor or a CompletableInteractor if we need
open class SingleInteractor<P, R>: Interactor {
    
    public typealias Params = P
    public typealias Response = R
    
    open func execute(params: Params, completion: @escaping (Result<Response, Error>) -> Void) -> Disposable {
        return buildUseCase(params: params)
            .subscribe(completion)
    }
    
    open func buildUseCase(params: Params) -> Single<Response> {
        return Single.create { _ in
            return Disposables.create()
        }
    }
}
