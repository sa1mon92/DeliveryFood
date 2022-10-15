//
//  AssemblyModuleBuilder.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 15.10.2022.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMenuModule(router: RouterProtocol) -> UIViewController
    func createContactsModule(router: RouterProtocol) -> UIViewController
    func createProfileModule(router: RouterProtocol) -> UIViewController
    func createCartModule(router: RouterProtocol) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    
    func createMenuModule(router: RouterProtocol) -> UIViewController {
        let view = MenuViewController()
        view.tabBarItem.image =  UIImage(named: "Menu")
        view.tabBarItem.title = "Меню"
        let networkManager = NetworkManager()
        let presenter = MainPresenter(view: view, networkManager: networkManager, router: router)
        view.presenter = presenter
        return UINavigationController(rootViewController: view)
    }
    
    func createContactsModule(router: RouterProtocol) -> UIViewController {
        let view = ContactsViewController()
        view.tabBarItem.image =  UIImage(named: "Location")
        view.tabBarItem.title = "Контакты"
        let networkManager = NetworkManager()
        let presenter = ContactsPresenter(view: view, networkManager: networkManager, router: router)
        view.presenter = presenter
        return UINavigationController(rootViewController: view)
    }
    
    func createProfileModule(router: RouterProtocol) -> UIViewController {
        let view = ProfileViewController()
        view.tabBarItem.image =  UIImage(named: "Profile")
        view.tabBarItem.title = "Профиль"
        let networkManager = NetworkManager()
        let presenter = ProfilePresenter(view: view, networkManager: networkManager, router: router)
        view.presenter = presenter
        return UINavigationController(rootViewController: view)
    }
    
    func createCartModule(router: RouterProtocol) -> UIViewController {
        let view = CartViewController()
        view.tabBarItem.image =  UIImage(named: "Cart")
        view.tabBarItem.title = "Корзина"
        let networkManager = NetworkManager()
        let presenter = CartPresenter(view: view, networkManager: networkManager, router: router)
        view.presenter = presenter
        return UINavigationController(rootViewController: view)
    }
}
