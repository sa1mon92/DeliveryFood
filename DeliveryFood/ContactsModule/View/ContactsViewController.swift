//
//  ContactsViewController.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 15.10.2022.
//

import UIKit

protocol ContactsViewProtocol: AnyObject {
    
}

class ContactsViewController: UIViewController {
    
    var presenter: ContsctsViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ContactsViewController: ContactsViewProtocol {
    
}
