//
//  ShowDetailViewController.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

import UIKit

final class ShowDetailViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension ShowDetailViewController {
    func setupTableView() {
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(ShowDetailCell.self, forCellReuseIdentifier: ShowDetailCell.reuseIdentifier)
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
