//
//  ShowCoordinator.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 26/12/21.
//

import UIKit
import Domain

protocol ShowItemsFlow: AnyObject {
    func showDetail(_ showType: ShowCategory, _ showId: Int)
}

final class ShowCoordinator: Coordinator, ShowItemsFlow {
    var navigationController: UINavigationController
    
    init(_ navController: UINavigationController) {
        navigationController = navController
    }
    
    func start() {
        let viewModel = ShowViewModel()
        let vc = ShowViewController(viewModel)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showDetail(_ showType: ShowCategory, _ showId: Int) {
        let detailCoordinator = ShowDetailCoordinator(navController: navigationController, params: (showType, showId))
        coordinate(to: detailCoordinator)
    }
}
