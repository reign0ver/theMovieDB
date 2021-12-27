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
        
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: imageURL, 
            options: [.scaleFactor(UIScreen.main.scale), .transition(.fade(0.2)), .cacheMemoryOnly]
        )
    }
}
