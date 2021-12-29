//
//  SingleInteractorStub.swift
//  Domain
//
//  Created by Andres Enrique Carrillo Miranda on 28/12/21.
//

import RxSwift

open class SingleInteractorStub<Params, Response>: SingleInteractor<Params, Response> {
    
    public enum InteractorStubCase {
        case success(Response)
        case failure(Error)
    }
    
    open var responseHandler: InteractorStubCase!
    
    public override init() {
        super.init()
        responseHandler = .failure(InteractorStubError.missingResponseHandler)
    }
    
    open override func buildUseCase(params: Params) -> Single<Response> {
        switch responseHandler! {
        case let .success(response):
            return Single.just(response)
        case .failure(let error):
            return Single.error(error)
        }
    }
}

public enum InteractorStubError: Error {
    case missingResponseHandler
    case expectedError
    
    public var errorDescription: String {
        switch self {
        case .missingResponseHandler:
            return "Response handler not defined in Stub"
        case .expectedError:
            return "Expected error"
        }
    }
}
