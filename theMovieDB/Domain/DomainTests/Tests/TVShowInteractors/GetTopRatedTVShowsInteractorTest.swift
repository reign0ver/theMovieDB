//
//  GetTopRatedTVShowsInteractorTest.swift
//  DomainTests
//
//  Created by Andres Enrique Carrillo Miranda on 28/12/21.
//

import XCTest
import Domain
import RxSwift

final class GetTopRatedTVShowsInteractorTest: XCTestCase {
    
    private let disposeBag = DisposeBag()
    private var sut: GetTopRatedTVShowsInteractor!
    private var repositoryStub: TVShowsRepositoryStub!
    
    override func setUp() {
        super.setUp()
        repositoryStub = TVShowsRepositoryStub()
        sut = GetTopRatedTVShowsInteractor(tvShowsRepository: repositoryStub)
    }
    
    override func tearDown() {
        repositoryStub = nil
        sut = nil
        super.tearDown()
    }
    
    func test_buildUseCase_WhenUseCaseIsCalledThenReturnSuccessCase() {
        // given
        let expectation = XCTestExpectation(description: "create use case and success case")
        let params = ShowParams(page: 1)
        
        repositoryStub.returnSuccessResponse = true
        
        // when
        sut.execute(params: params) { result in
            switch result {
            case .success:
                expectation.fulfill()
            case .failure:
                XCTFail("Should fall in success case")
            }
        }.disposed(by: disposeBag)
        
        // then
        wait(for: [expectation], timeout: 1)
    }
    
    func test_buildUseCase_WhenUseCaseIsCalledThenReturnFailureCase() {
        // given
        let expectation = XCTestExpectation(description: "create use case and failure case")
        let params = ShowParams(page: 1)
        
        repositoryStub.returnSuccessResponse = false
        
        // when
        sut.execute(params: params) { result in
            switch result {
            case .success:
                XCTFail("Should fall in failure case")
            case .failure:
                expectation.fulfill()
            }
        }.disposed(by: disposeBag)
        
        // then
        wait(for: [expectation], timeout: 1)
    }
}

