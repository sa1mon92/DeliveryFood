//
//  CartViewController.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 15.10.2022.
//

import UIKit

protocol CartViewProtocol: AnyObject {
    
}

class CartViewController: UIViewController {
    
    var presenter: CartViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension CartViewController: CartViewProtocol {
    
}
