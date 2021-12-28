//
//  ShowItemCollectionViewCell.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

import UIKit

final class ShowItemCollectionViewCell: UICollectionViewCell, ReusableIdentifier {
    var imageURL: String? {
        didSet {
            posterImageView.setImage(from: imageURL ?? "")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .appWhite
        setupPosterImageViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    private func setupPosterImageViewConstraints() {
        contentView.addSubview(posterImageView)
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
