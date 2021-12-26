//
//  MovieCoordinator.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 26/12/21.
//

import UIKit

final class MovieCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(_ navController: UINavigationController) {
        navigationController = navController
    }
    
    func start() {
        let vc = MoviesViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
