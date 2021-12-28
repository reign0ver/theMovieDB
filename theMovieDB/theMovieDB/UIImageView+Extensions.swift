//
//  UIImageView+Extensions.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 26/12/21.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else {
            return
        }
        
        let defaultPlaceholderView = DefaultImageViewPlaceholder()
        
        kf.indicatorType = .activity
        kf.setImage(
            with: imageURL, 
            placeholder: nil,
            options: [.scaleFactor(UIScreen.main.scale), .transition(.fade(0.25)), .cacheMemoryOnly]
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success: break
            case .failure:
                self.addSubview(defaultPlaceholderView)
                defaultPlaceholderView.translatesAutoresizingMaskIntoConstraints = false
                defaultPlaceholderView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
                defaultPlaceholderView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
                
            }
        }
    }
}
