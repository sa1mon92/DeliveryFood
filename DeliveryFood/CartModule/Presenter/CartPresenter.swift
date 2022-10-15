//
//  CartPresenter.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 15.10.2022.
//

import Foundation

protocol CartViewPresenterProtocol: AnyObject {
    init(view: CartViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol)
}

class CartPresenter: CartViewPresenterProtocol {
    
    let networkManager: NetworkManagerProtocol!
    weak var view: CartViewProtocol?
    var router: RouterProtocol?
    
    required init(view: CartViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol) {
        self.view = view
        self.networkManager = networkManager
        self.router = router
    }
}
