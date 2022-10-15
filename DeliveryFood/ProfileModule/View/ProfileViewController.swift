//
//  ProfileViewController.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 15.10.2022.
//

import UIKit

protocol ProfileViewProtocol: AnyObject {
    
}

class ProfileViewController: UIViewController {
    
    var presenter: ProfileViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension ProfileViewController: ProfileViewProtocol {
    
}
