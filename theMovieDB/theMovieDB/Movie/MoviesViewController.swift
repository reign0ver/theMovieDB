//
//  MoviesViewController.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 26/12/21.
//

import UIKit

final class MoviesViewController: UIViewController {
    
    weak var coordinator: MovieCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(named: "appWhite")
        setupNavigationBar()
        print("MoviesViewController launched!")
    }
}

private extension MoviesViewController {
    func setupNavigationBar() {
        navigationItem.title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
