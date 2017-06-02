//
//  TabBarViewController.swift
//  NotUseStoryboardUI
//
//  Created by Terry Yang on 2017/6/1.
//  Copyright © 2017年 terryyamg. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    var titles: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titles
        self.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let tabOne = TabBarOneViewController()
        let tabOneBarItem = UITabBarItem(title: "Tab One", image: UIImage(named: "ic_star_popular_activate.png"), selectedImage: UIImage(named: "ic_star_popular_half.png"))
        tabOne.tabBarItem = tabOneBarItem
        
        
        let tabTwo = TabBarTwoViewController()
        let tabTwoBarItem = UITabBarItem(title: "Tab Two", image: UIImage(named: "ic_star_popular_activate.png"), selectedImage: UIImage(named: "ic_star_popular_half.png"))
        tabTwo.tabBarItem = tabTwoBarItem
        
        self.viewControllers = [tabOne, tabTwo]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Select \(viewController.title!)")
    }
    
    
}
