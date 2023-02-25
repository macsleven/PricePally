//
//  CustomTabBarViewController.swift
//  pricepally
//
//  Created by Suleiman Abubakar on 23/02/2023.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Tab Bar Customisation
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.selectedItem?.badgeColor = UIColor(red: 0.702, green: 0.337, blue: 0.106, alpha: 1)
        tabBar.tintColor = UIColor(red: 0.702, green: 0.337, blue: 0.106, alpha: 1)
        self.tabBar.backgroundColor = .white
        self.navigationController?.isToolbarHidden = true
        self.navigationController?.isNavigationBarHidden = true

        viewControllers = [
            createTabBarItem(tabBarTitle: "Home", tabBarImage: "home_icon", viewController: HomeVC.instantiate(from: .Main)),
            createTabBarItem(tabBarTitle: "Users", tabBarImage: "user_icon", viewController: HomeVC.instantiate(from: .Main)),
            createTabBarItem(tabBarTitle: "Cart", tabBarImage: "cart_icon", viewController: HomeVC.instantiate(from: .Main)),
            createTabBarItem(tabBarTitle: "Orders", tabBarImage: "order_icon", viewController: HomeVC.instantiate(from: .Main)),
            createTabBarItem(tabBarTitle: "More", tabBarImage: "more_icon", viewController: HomeVC.instantiate(from: .Main)),
        ]
    }

    func createTabBarItem(tabBarTitle: String, tabBarImage: String, viewController: UIViewController) -> UINavigationController {
        let navCont = UINavigationController(rootViewController: viewController)
        navCont.isNavigationBarHidden = true
        navCont.tabBarItem.title = tabBarTitle
        navCont.tabBarItem.image = UIImage(named: tabBarImage)
        return navCont
    }
}
