//
//  MainTabBarViewController.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 15.10.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = Constants.categoryColor
        tabBar.backgroundColor = .white
    }
}
