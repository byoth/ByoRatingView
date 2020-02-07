//
//  ViewController.swift
//  ByoRatingViewExample
//
//  Created by Taehyun Jo on 2020/02/05.
//  Copyright © 2020 byo. All rights reserved.
//

import UIKit

import ByoRatingView


class ViewController: UIViewController {
    @IBOutlet weak var ratingView: ByoRatingView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupRatingView()
    }
    
    
    private func setupRatingView() {
        var viewModel: ByoRatingViewModel = .init()
        
        viewModel.itemImageNames = (full: "i_star_full", half: "i_star_half", empty: "i_star_empty")
        
        self.ratingView.bind(viewModel: viewModel)
    }
}

