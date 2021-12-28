//
//  ShowDetailViewController.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

import UIKit
import RxSwift
import Domain

final class ShowDetailViewController: UITableViewController {
    private let viewModel: ShowDetailViewModelType
    private let disposeBag = DisposeBag()
    private var showDetail: ShowDetail?
    
    init(_ viewModel: ShowDetailViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        viewModel.getShowDetail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        setupTableView()
        view.backgroundColor = .appWhite
    }
}

private extension ShowDetailViewController {
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func setupTableView() {
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(ShowDetailCell.self, forCellReuseIdentifier: ShowDetailCell.reuseIdentifier)
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
    
    func handleViewState(_ newViewState: ShowDetailViewState) {
        switch newViewState {
        case let .showDetail(showDetail):
            self.showDetail = showDetail
            tableView.reloadData()
        case .showError:
            break
        case .showLoading:
            break
        case .hideLoading:
            break
        }
    }
}

// MARK: TableView Delegate and DataSource
extension ShowDetailViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShowDetailCell.reuseIdentifier) as? ShowDetailCell else {
            return UITableViewCell()
        }
        
        if let showDetail = showDetail {
            cell.configureCell(showDetail)
        }
        
        return cell
    }
}
