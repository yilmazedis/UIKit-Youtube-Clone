//
//  ViewController.swift
//  UIKit-Youtube-Clone
//
//  Created by yilmaz on 1.06.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: ShortsViewController())
        let vc3 = UINavigationController(rootViewController: SubscriptionsViewController())
        let vc4 = UINavigationController(rootViewController: LibraryViewController())

        vc1.tabBarItem.image = UIImage(named: "Home")
        vc2.tabBarItem.image = UIImage(named: "Shorts")
        vc3.tabBarItem.image = UIImage(named: "Subscriptions")
        vc4.tabBarItem.image = UIImage(named: "Library")

        vc1.title = "Home"
        vc2.title = "Shorts"
        vc3.title = "Subscriptions"
        vc4.title = "Library"
        
        //tabBar.tintColor = UIColor(named: "NavBarColor") ?? .systemBlue
                
        let appearance = tabBar.standardAppearance
        appearance.configureWithDefaultBackground()
        //appearance.backgroundColor = UIColor(named: "NavBarColor") ?? .systemBlue
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        } else {
            tabBar.standardAppearance = appearance
        }
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
}

