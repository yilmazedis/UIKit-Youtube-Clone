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
        

        
        delegate = self

        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: ShortsViewController())
        let vc3 = UINavigationController(rootViewController: CreateViewController())
        let vc4 = UINavigationController(rootViewController: SubscriptionsViewController())
        let vc5 = UINavigationController(rootViewController: LibraryViewController())

        vc1.tabBarItem.image = UIImage(named: "Home")
        vc2.tabBarItem.image = UIImage(named: "Shorts")
        vc3.tabBarItem.image = UIImage(systemName: "plus.circle")
        vc4.tabBarItem.image = UIImage(named: "Subscriptions")
        vc5.tabBarItem.image = UIImage(named: "Library")

        vc1.title = "Home"
        vc2.title = "Shorts"
        vc4.title = "Subscriptions"
        vc5.title = "Library"
               
        let appearance = tabBar.standardAppearance
        appearance.configureWithDefaultBackground()
        //appearance.backgroundColor = UIColor(named: "NavBarColor") ?? .systemBlue
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        } else {
            tabBar.standardAppearance = appearance
        }

        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }
    

}


// MARK: - UITabBarController Delegate
extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController) else {
            return true
        }
        
        // Your middle tab bar item index.
        // In my case it's 1.
        if selectedIndex == 2 {
            
            let viewController = CreateViewController()
            present(viewController, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
}
