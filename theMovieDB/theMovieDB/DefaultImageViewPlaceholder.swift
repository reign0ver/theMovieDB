//
//  DefaultImageViewPlaceholder.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 28/12/21.
//

import UIKit

final class DefaultImageViewPlaceholder: UIView {
    
    private let placeholderLabel: UILabel = {
        let defaultMessage = "No image available"
        let label = UILabel()
        label.text = defaultMessage
        label.font = .italicSystemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        placeholderLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setCustomMessage(_ message: String) {
        placeholderLabel.text = message
    }
}
