//
//  ViewController.swift
//  theMovieDB
//
//  Created by Andres Enrique Carrillo Miranda on 23/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel: MoviesViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MoviesViewModel()
        viewModel.getMovies()
    }


}

