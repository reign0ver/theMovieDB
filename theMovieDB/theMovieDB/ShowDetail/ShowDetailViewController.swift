//
//  ShowDetailViewController.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

import UIKit
import RxSwift

final class ShowDetailViewController: UITableViewController {
    private let viewModel: ShowDetailViewModelType
    private let disposeBag = DisposeBag()
    
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
        setupTableView()
        view.backgroundColor = .appWhite
    }
}

private extension ShowDetailViewController {
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
            break
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
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
