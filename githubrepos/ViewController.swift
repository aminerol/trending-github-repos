//
//  ViewController.swift
//  githubrepos
//
//  Created by Monsef Chakir on 29/11/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    func setupNavBar(){
        title = "Trending Repos"
        navigationController?.navigationBar.tintColor = .mainColor
        navigationController?.navigationBar.backgroundColor = .mainColor
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        setupNavBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

