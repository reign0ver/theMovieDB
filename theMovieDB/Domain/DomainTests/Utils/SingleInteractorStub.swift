//
//  SingleInteractorStub.swift
//  DomainTests
//
//  Created by Andres Enrique Carrillo Miranda on 28/12/21.
//

import RxSwift
import Domain

class SingleInteractorStub<Params, Response>: SingleInteractor<Params, Response> {
    
    enum InteractorStubCase {
        case success(Response)
        case failure(Error)
    }
    
    var responseHandler: InteractorStubCase = .failure(InteractorStubError.missingResponseHandler)
    
    override func buildUseCase(params: Params) -> Single<Response> {
        switch responseHandler {
        case let .success(response):
            return Single.just(response)
        case .failure(let error):
            return Single.error(error)
        }
    }
}

enum InteractorStubError: Error {
    case missingResponseHandler
    case expectedError
    
    var errorDescription: String {
        switch self {
        case .missingResponseHandler:
            return "Response handler not defined in Stub"
        case .expectedError:
            return "Expected error"
        }
    }
}
