//
//  MoviesViewController.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 26/12/21.
//

import UIKit
import Domain
import RxSwift

final class MoviesViewController: UITableViewController {
    
    private let viewModel: MoviesViewModelType
    weak var coordinator: MovieCoordinator?
    
    private let disposeBag = DisposeBag()
    
    private var dataSource = [(category: ShowCategory, shows: [Show])]() // we can maybe move this dataSource?
    
    init(_ viewModel: MoviesViewModelType = MoviesViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        viewModel.getShows()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        view.backgroundColor = .appWhite
        setupTableView()
    }
}

private extension MoviesViewController {
    func setupNavigationBar() {
        navigationItem.title = "theMovieDB"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupTableView() {
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(CategoryItemCell.self, forCellReuseIdentifier: CategoryItemCell.reuseIdentifier)
    }
    
    func setupBinding() {
        viewModel.getViewStateObservable().subscribe { [weak self] viewStateEvent in
            DispatchQueue.main.async {
                switch viewStateEvent {
                case let .next(event):
                    self?.handleViewState(event)
                case .error, .completed:
                    break
                }
            }
        }.disposed(by: disposeBag)
    }
    
    func handleViewState(_ newViewState: MoviesViewState) {
        switch newViewState {
        case let .showShows(category, shows):
            dataSource.append((category, shows))
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: self.dataSource.count - 1, section: 0)], with: .right)
            tableView.endUpdates()
        case .showError:
            break
        case .showLoading:
            break
        case .hideLoading:
            break
        }
    }
}

// MARK: - TableView Delegate and DataSource
extension MoviesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryItemCell.reuseIdentifier) as? CategoryItemCell else {
            return UITableViewCell()
        }
        
        let currentItem = dataSource[indexPath.row]
        cell.configureCell(with: currentItem.shows, category: currentItem.category)
        
        return cell
    }
}
