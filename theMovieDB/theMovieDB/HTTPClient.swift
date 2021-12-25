//
//  HTTPClient.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 24/12/21.
//

import Alamofire
import RxSwift
import Domain

final class HTTPClient: HTTPClientType {
    
    func sendRequest<T: Codable>(_ endpoint: EndpointType, of: T.Type) -> Single<ServerResponse<T>> {
        return Single<ServerResponse<T>>.create { emitter -> Disposable in
            guard let urlRequest = try? endpoint.asURLRequest() else {
                emitter(.failure(NetworkError.invalidURL))
                return Disposables.create()
            }
            
            let dataRequest = AF.request(urlRequest)
            dataRequest.responseDecodable(of: ServerResponse<T>.self, queue: .global(qos: .background)) { [weak self] dataResponse in
                switch dataResponse.result {
                case .success(let serverResponse):
                    emitter(.success(serverResponse))
                case .failure(let error):
                    self?.handleError(error, emitter: emitter)
                }
            }
            
            return Disposables.create()
        }
    }
    
    private func handleError<T: Codable>(_ error: AFError, emitter: (SingleEvent<ServerResponse<T>>) -> Void) {
        if error.isResponseSerializationError {
            emitter(.failure(NetworkError.responseSerializacion))
        } else if error.isInvalidURLError {
            emitter(.failure(NetworkError.invalidURL))
        } else if let urlError = error.underlyingError as? URLError {
            switch urlError.code {
            case .notConnectedToInternet:
                emitter(.failure(NetworkError.noInternetConnection))
            default:
                emitter(.failure(NetworkError.unhandledError))
            }
        } else {
            emitter(.failure(NetworkError.unhandledError))
        }
    }
}
