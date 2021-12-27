//
//  ReusableIdentifier.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 27/12/21.
//

import UIKit

protocol ReusableIdentifier: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReusableIdentifier where Self: UIView {
    static var reuseIdentifier: String { return String(describing: self) }
}
