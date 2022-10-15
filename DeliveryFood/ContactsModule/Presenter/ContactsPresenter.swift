//
//  ContactsPresenter.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 15.10.2022.
//

import Foundation

protocol ContsctsViewPresenterProtocol: AnyObject {
    init(view: ContactsViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol)
}

class ContactsPresenter: ContsctsViewPresenterProtocol {
    
    let networkManager: NetworkManagerProtocol!
    weak var view: ContactsViewProtocol?
    var router: RouterProtocol?
    
    required init(view: ContactsViewProtocol, networkManager: NetworkManagerProtocol, router: RouterProtocol) {
        self.view = view
        self.networkManager = networkManager
        self.router = router
    }
}


