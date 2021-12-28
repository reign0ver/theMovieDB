//
//  CategoryItemCell.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 26/12/21.
//

import UIKit
import Domain

final class CategoryItemCell: UITableViewCell, ReusableIdentifier {
    private var collectionView: UICollectionView!
    private var categoryNameLabel: UILabel!
    
    private var items = [Show]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCategoryNameLabel()
        setupCategoryNameLabelConstraints()
        
        setupCollectionView()
        setupCollectionViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with show: [Show], category: ShowCategory) {
        items = show
        categoryNameLabel.text = "\(category.name)"
        collectionView.reloadData()
    }
    
    private func setupCategoryNameLabel() {
        categoryNameLabel = UILabel()
        categoryNameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        categoryNameLabel.text = "Default Title"
    }
    
    private func setupCategoryNameLabelConstraints() {
        contentView.addSubview(categoryNameLabel)
        categoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            categoryNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            categoryNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            categoryNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .appWhite
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ShowItemCollectionViewCell.self, forCellWithReuseIdentifier: ShowItemCollectionViewCell.reuseIdentifier)
    }
    
    private func setupCollectionViewConstraints() {
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: categoryNameLabel.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: (contentView.frame.width / 2) + 20),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension CategoryItemCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select show with ID: \(items[indexPath.row].id)")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowItemCollectionViewCell.reuseIdentifier, for: indexPath) as? ShowItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.imageURL = items[indexPath.row].imageURL
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 3), height: collectionView.frame.height)
    }
}
