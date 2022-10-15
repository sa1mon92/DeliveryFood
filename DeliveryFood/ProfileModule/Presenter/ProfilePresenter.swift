//
//  ProfilePresenter.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 15.10.2022.
//

import Foundation

protocol ProfileViewPresenterProtocol: AnyObject {
    init(view: ProfileViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol)
}

class ProfilePresenter: ProfileViewPresenterProtocol {
    
    let networkManager: NetworkManagerProtocol!
    weak var view: ProfileViewProtocol?
    var router: RouterProtocol?
    
    required init(view: ProfileViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol) {
        self.view = view
        self.networkManager = networkManager
        self.router = router
    }
}
