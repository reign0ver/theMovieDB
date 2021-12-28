//
//  ShowDetailCell.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

import UIKit
import Domain

final class ShowDetailCell: UITableViewCell, ReusableIdentifier {
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        
        return label
    }()
    
    private let genresLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .italicSystemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(_ showDetail: ShowDetail) {
        let genresText = showDetail.genres.joined(separator: ", ")
        let releaseYear = showDetail.releaseDate.components(separatedBy: "-").first
        headerImageView.setImage(from: showDetail.imageURL)
        titleLabel.text = showDetail.title
        releaseDateLabel.text = releaseYear ?? showDetail.releaseDate
        overviewLabel.text = showDetail.overview
        genresLabel.text = genresText
    }
}

// MARK: Constraints
private extension ShowDetailCell {
    func setupConstraints() {
        setupHeaderImageViewConstraints()
        setupStackViewConstraints()
    }
    
    func setupStackViewConstraints() {
        contentView.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(releaseDateLabel)
        containerStackView.addArrangedSubview(genresLabel)
        containerStackView.addArrangedSubview(overviewLabel)
        
        let constraints = [
            containerStackView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 8),
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupHeaderImageViewConstraints() {
        contentView.addSubview(headerImageView)
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            headerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: (contentView.frame.width / 2) + 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
