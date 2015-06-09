//
//  DetailMovieViewController.swift
//  FindAMovie
//
//  Created by Paul on 09/06/2015.
//  Copyright (c) 2015 Hetic. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
}
