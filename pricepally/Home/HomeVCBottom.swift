//
//  HomeVCBottomVC.swift
//  pricepally
//
//  Created by Suleiman Abubakar on 23/02/2023.
//

import UIKit
import Tabman
import Pageboy


class HomeVCBottom: TabmanViewController {
    
    /// View controllers that will be displayed in page view controller.
       private lazy var viewControllers: [UIViewController] = [
        CategoryViewController.instantiate(from: .Main), CategoryViewController.instantiate(from: .Main),CategoryViewController.instantiate(from: .Main),CategoryViewController.instantiate(from: .Main)
       ]
       
       // MARK: Lifecycle
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           // Set PageboyViewControllerDataSource dataSource to configure page view controller.
           dataSource = self
           
           // Create a bar
           let bar = TMBarView.ButtonBar()
           
           // Customize bar properties including layout and other styling.
           bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 4.0, right: 16.0)
           bar.layout.interButtonSpacing = 24.0
           bar.indicator.weight = .light
           bar.indicator.cornerStyle = .eliptical
           bar.fadesContentEdges = true
           bar.spacing = 16.0
           
           bar.backgroundColor = .white
           
           // Set tint colors for the bar buttons and indicator.
           bar.buttons.customize {
               $0.tintColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
               $0.selectedTintColor = UIColor(red: 0.702, green: 0.337, blue: 0.106, alpha: 1)
               $0.adjustsFontForContentSizeCategory = true
               if let fontVa = UIFont(name: "Roboto-Regular", size: 16) {
                   $0.font = fontVa
               }
           }
           bar.indicator.tintColor = UIColor(red: 0.702, green: 0.337, blue: 0.106, alpha: 1)
           
           // Add bar to the view - as a .systemBar() to add UIKit style system background views.
           addBar(bar.systemBar(), dataSource: self, at: .top)
       }
}

extension HomeVCBottom: PageboyViewControllerDataSource, TMBarDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return .first
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        switch index {
        case 0:
            return TMBarItem(title: "Categories")
        case 1:
            return TMBarItem(title: "Pally Deals")
        case 2:
            return TMBarItem(title: "Recommended")
        case 3:
            return TMBarItem(title: "Pre Order")
        default:
            return TMBarItem(title: "Category")
        }
    }
}
