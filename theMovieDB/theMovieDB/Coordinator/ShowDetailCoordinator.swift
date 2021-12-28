//
//  ShowDetailCoordinator.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 28/12/21.
//

import UIKit
import Domain

typealias ShowDetailCoordinatorParams = (showType: ShowCategory, showId: Int)

final class ShowDetailCoordinator: Coordinator {
    private let params: ShowDetailCoordinatorParams
    var navigationController: UINavigationController
    
    init(navController: UINavigationController, params: ShowDetailCoordinatorParams) {
        self.params = params
        self.navigationController = navController
    }
    
    func start() {
        let viewModel = ShowDetailViewModel(params: params)
        let vc = ShowDetailViewController(viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}
