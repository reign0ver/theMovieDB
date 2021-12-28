//
//  ShowDetailCell.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

import UIKit

final class ShowDetailCell: UITableViewCell, ReusableIdentifier {
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let genresLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Constraints
private extension ShowDetailCell {
    func setupConstraints() {
        setupStackViewConstraints()
        setupHeaderImageViewConstraints()
        setupReleaseDateLabelConstraints()
        setupOverviewConstraints()
        setupGenresLabelConstraints()
    }
    
    func setupStackViewConstraints() {
        contentView.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerStackView.addArrangedSubview(headerImageView)
        containerStackView.addArrangedSubview(releaseDateLabel)
        containerStackView.addArrangedSubview(overviewLabel)
        containerStackView.addArrangedSubview(genresLabel)
        
        let constraints = [
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupHeaderImageViewConstraints() {
        
    }
    
    func setupReleaseDateLabelConstraints() {
        
    }
    
    func setupOverviewConstraints() {
        
    }
    
    func setupGenresLabelConstraints() {
        
    }
}
