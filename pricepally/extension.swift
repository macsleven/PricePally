//
//  extension.swift
//  pricepally
//
//  Created by Suleiman Abubakar on 23/02/2023.
//

import UIKit

extension UIViewController {
    // Not using static so that individual VCs can override to provide custom storyboardID value.
    // By default, this returns the name of VC class as the storyboard ID.
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiate(from storyboard: Storyboard) -> Self {
        return storyboard.instantiateViewController(for: self)
    }
    
    func wrapInNavigationcontroller() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
