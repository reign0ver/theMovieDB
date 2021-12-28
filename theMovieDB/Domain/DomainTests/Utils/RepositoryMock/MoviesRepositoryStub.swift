//
//  MoviesRepositoryStub.swift
//  DomainTests
//
//  Created by Andres Enrique Carrillo Miranda on 28/12/21.
//

import Domain
import RxSwift

final class MoviesRepositoryStub: MovieRepositoryType, RepositoryClientStubTestable {
    
    var returnSuccessResponse: Bool = true
    
    func getPopularMovies(params: ShowParams) -> Single<[Movie]> {
        return Single.create { emitter in
            if self.returnSuccessResponse {
                emitter(.success([]))
            } else {
                emitter(.failure(TestError.emptyJSON))
            }
            return Disposables.create()
        }
    }
    
    func getTopRatedMovies(params: ShowParams) -> Single<[Movie]> {
        return Single.create { emitter in
            if self.returnSuccessResponse {
                emitter(.success([]))
            } else {
                emitter(.failure(TestError.emptyJSON))
            }
            return Disposables.create()
        }
    }
    
    func getUpcomingMovies(params: ShowParams) -> Single<[Movie]> {
        return Single.create { emitter in
            if self.returnSuccessResponse {
                emitter(.success([]))
            } else {
                emitter(.failure(TestError.emptyJSON))
            }
            return Disposables.create()
        }
    }
    
    func getMovieDetail(params: ShowDetailParams) -> Single<ShowDetail> {
        return Single.create { emitter in
            if self.returnSuccessResponse {
                emitter(.success(MovieDetail(title: "", releaseDate: "", overview: "", imageURL: "", voteAverage: "", genres: [])))
            } else {
                emitter(.failure(TestError.emptyJSON))
            }
            return Disposables.create()
        }
    }
}
