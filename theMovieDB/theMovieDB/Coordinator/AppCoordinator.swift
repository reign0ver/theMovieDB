//
//  AppCoordinator.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 26/12/21.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    private let window: UIWindow
    private let showCoordinator: ShowCoordinator
    
    init(_ window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        showCoordinator = ShowCoordinator(navigationController)
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        startApp()
    }
    
    func startApp() {
        coordinate(to: showCoordinator)
    }
}
