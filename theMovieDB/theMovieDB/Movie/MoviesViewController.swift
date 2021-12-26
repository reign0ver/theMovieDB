//
//  MoviesViewController.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 26/12/21.
//

import UIKit

final class MoviesViewController: UITableViewController {
    
    private let viewModel: MoviesViewModelType
    weak var coordinator: MovieCoordinator?
    
    init(_ viewModel: MoviesViewModelType = MoviesViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        view.backgroundColor = .appWhite
    }
}

private extension MoviesViewController {
    func setupNavigationBar() {
        navigationItem.title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - TableView Delegate and DataSource
extension MoviesViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3 // remove this magic number
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
