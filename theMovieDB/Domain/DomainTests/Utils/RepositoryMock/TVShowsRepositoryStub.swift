//
//  TVShowsRepositoryStub.swift
//  DomainTests
//
//  Created by Andres Enrique Carrillo Miranda on 28/12/21.
//

import Domain
import RxSwift

final class TVShowsRepositoryStub: TVShowRepositoryType, RepositoryClientStubTestable {
    
    var returnSuccessResponse: Bool = true
    
    func getPopularTVShows(params: ShowParams) -> Single<[TVShow]> {
        return Single.create { emitter in
            if self.returnSuccessResponse {
                emitter(.success([]))
            } else {
                emitter(.failure(TestError.emptyJSON))
            }
            return Disposables.create()
        }
    }
    
    func getTopRatedTVShows(params: ShowParams) -> Single<[TVShow]> {
        return Single.create { emitter in
            if self.returnSuccessResponse {
                emitter(.success([]))
            } else {
                emitter(.failure(TestError.emptyJSON))
            }
            return Disposables.create()
        }
    }
    
    func getTVShowDetail(params: ShowDetailParams) -> Single<ShowDetail> {
        return Single.create { emitter in
            if self.returnSuccessResponse {
                emitter(.success(TVShowDetail(
                    title: "", 
                    releaseDate: "", 
                    overview: "", 
                    imageURL: "", 
                    voteAverage: "", 
                    genres: []))
                )
            } else {
                emitter(.failure(TestError.emptyJSON))
            }
            return Disposables.create()
        }
    }
} 
