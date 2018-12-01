//
//  HomeTabController.swift
//  githubrepos
//
//  Created by Monsef Chakir on 01/12/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import UIKit

class HomeTabController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reposController = UINavigationController(rootViewController: ReposViewController())
        reposController.tabBarItem.title = "Trending"
        reposController.tabBarItem.image = UIImage(named: "icons")
        
        let dummyController = UINavigationController(rootViewController: DummyViewController())
        dummyController.tabBarItem.title = "Settings"
        dummyController.tabBarItem.image = UIImage(named: "settings")
        
        viewControllers = [reposController, dummyController]
    }
}
