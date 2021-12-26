//
//  ViewController.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import UIKit
import Domain
import Data
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        let interactor = GetPopularMoviesInteractor(moviesRepository: movieRepository)
        interactor.execute(params: MovieParams(page: 1)) { result in
            switch result {
            case .success(let movies):
                print(movies)
            case .failure(let error):
                print(error)
            }
        }.disposed(by: disposeBag)
    }


}

