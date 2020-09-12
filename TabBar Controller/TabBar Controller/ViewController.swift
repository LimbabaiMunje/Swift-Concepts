//
//  ViewController.swift
//  TabBar Controller
//
//  Created by Mac on 11/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    let tabBar = UITabBarController()
    
    //MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tab()
    }
}
//MARK: - Programmatic TabBar
extension ViewController {
    func tab() {
        let favoritesVc = UIViewController()
        favoritesVc.view.backgroundColor = .cyan
        let downloadsVC = UIViewController()
        downloadsVC.view.backgroundColor = .systemIndigo
        let historyVC = UIViewController()
        historyVC.view.backgroundColor = .systemTeal
        let downloads = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        let favorites = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let history = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        
        favoritesVc.tabBarItem = favorites
        historyVC.tabBarItem = history
        downloadsVC.tabBarItem = downloads
        
        tabBar.viewControllers = [favoritesVc, downloadsVC, historyVC]
        self.view.addSubview(tabBar.view)
    }
}

