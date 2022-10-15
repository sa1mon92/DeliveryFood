//
//  Router.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 15.10.2022.
//

import UIKit

protocol RouterMain {
    var tabBarController: UITabBarController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
}

class Router: RouterProtocol {
    var tabBarController: UITabBarController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(tabBarController: UITabBarController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.tabBarController = tabBarController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let tabBarController = tabBarController {
            guard let menuViewController = assemblyBuilder?.createMenuModule(router: self),
                  let contactsViewController = assemblyBuilder?.createContactsModule(router: self),
                  let profileViewController = assemblyBuilder?.createProfileModule(router: self),
                  let cartViewController = assemblyBuilder?.createCartModule(router: self)
            else { return }
            tabBarController.viewControllers = [menuViewController, contactsViewController, profileViewController, cartViewController]
        }
    }
}
