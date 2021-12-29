//
//  ShowDetailViewModelTest.swift
//  theMovieDBTests
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import XCTest
import RxSwift
import Domain
@testable import theMovieDB

final class ShowDetailViewModelTest: XCTestCase {
    
    private var sut: ShowDetailViewModelType!
    private var dependencies: ShowDetailViewModel.Dependencies!
    private var getMovieDetailInteractorStub: GetMovieDetailsInteractorStub!
    private var getTVShowDetailInteractorStub: GetTVShowDetailsInteractorStub!
    
    private let disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        getMovieDetailInteractorStub = GetMovieDetailsInteractorStub()
        getTVShowDetailInteractorStub = GetTVShowDetailsInteractorStub()
        
        dependencies = ShowDetailViewModel.Dependencies(
            getMovieDetailInteractorStub, 
            getTVShowDetailInteractorStub
        )
        
        sut = ShowDetailViewModel(dependencies: dependencies, params: (ShowCategory.popularMovies, 2192))
    }
    
    override func tearDown() {
        getMovieDetailInteractorStub = nil
        getTVShowDetailInteractorStub = nil
        
        dependencies = nil
        sut = nil
        super.tearDown()
    }
    
    func test_getMovieDetail_WhenSucessfulResponse_ThenCheckViewStateCallsOrder() {
        // given
        let expectation = XCTestExpectation(description: "get movie detail")
        var viewStateCalls = [ShowDetailViewState]()
        
        let response = getMovieResponse()
        
        getMovieDetailInteractorStub.responseHandler = .success(response)
        
        sut.getViewStateObservable().subscribe { event in
            switch event {
            case let .next(viewState):
                viewStateCalls.append(viewState)
                switch viewState {
                case .showDetail:
                    expectation.fulfill()
                default:
                    break
                }
            case .error, .completed:
                XCTFail("get movie detail fall into an error! :[")
            }
        }.disposed(by: disposeBag)
        
        // when
        sut.getShowDetail()
        
        // when
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(viewStateCalls.count, 1)
        guard case .showDetail = viewStateCalls.popLast() else {
            XCTFail("ViewState did not match the expected state :[. Please check the order you're making the calls")
            return
        }
    }
    
    func test_getTVShowDetail_WhenSucessfulResponse_ThenCheckViewStateCallsOrder() {
        // given
        let expectation = XCTestExpectation(description: "get tvshow detail")
        var viewStateCalls = [ShowDetailViewState]()
        
        let response = getTVShowResponse()
        
        getMovieDetailInteractorStub.responseHandler = .success(response)
        
        sut.getViewStateObservable().subscribe { event in
            switch event {
            case let .next(viewState):
                viewStateCalls.append(viewState)
                switch viewState {
                case .showDetail:
                    expectation.fulfill()
                default:
                    break
                }
            case .error, .completed:
                XCTFail("get tvshow detail fall into an error! :[")
            }
        }.disposed(by: disposeBag)
        
        // when
        sut.getShowDetail()
        
        // when
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(viewStateCalls.count, 1)
        guard case .showDetail = viewStateCalls.popLast() else {
            XCTFail("ViewState did not match the expected state :[. Please check the order you're making the calls")
            return
        }
    }
    
    func test_getTVShowDetail_WhenGetShowDetailIsCalledMultipleTimes_ThenCheckViewStateCount() {
        // given
        let expectation = XCTestExpectation(description: "get tvshow detail")
        var viewStateCalls = [ShowDetailViewState]()
        
        let response = getTVShowResponse()
        
        getMovieDetailInteractorStub.responseHandler = .success(response)
        
        sut.getViewStateObservable().subscribe { event in
            switch event {
            case let .next(viewState):
                viewStateCalls.append(viewState)
                switch viewState {
                case .showDetail:
                    expectation.fulfill()
                default:
                    break
                }
            case .error, .completed:
                XCTFail("get tvshow detail fall into an error! :[")
            }
        }.disposed(by: disposeBag)
        
        // when
        sut.getShowDetail()
        sut.getShowDetail()
        
        // when
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(viewStateCalls.count, 2)
        guard case .showDetail = viewStateCalls.popLast() else {
            XCTFail("ViewState did not match the expected state :[. Please check the order you're making the calls")
            return
        }
    }
}

private extension ShowDetailViewModelTest {
    func getTVShowResponse() -> TVShowDetail {
        return TVShowDetail(
            title: "some tv show", 
            releaseDate: "some release date", 
            overview: "some overview", 
            imageURL: "some imageURL", 
            voteAverage: "7.5", 
            genres: []
        )
    }
    
    func getMovieResponse() -> MovieDetail {
        return MovieDetail(
            title: "some tv show", 
            releaseDate: "some release date", 
            overview: "some overview", 
            imageURL: "some imageURL", 
            voteAverage: "7.5", 
            genres: []
        )
    }
}
