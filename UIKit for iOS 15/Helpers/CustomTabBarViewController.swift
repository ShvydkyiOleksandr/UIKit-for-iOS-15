//
//  CustomTabBarViewController.swift
//  UIKit for iOS 15
//
//  Created by Олександр Швидкий on 10.10.2022.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = UIColor(named: "TabBarTint")!
        
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        self.tabBar.selectionIndicatorImage = UIImage(named: "Selected")
        self.additionalSafeAreaInsets.bottom = 20
    }
}
