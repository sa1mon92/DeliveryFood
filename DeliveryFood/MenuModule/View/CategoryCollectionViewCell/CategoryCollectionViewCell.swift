//
//  CategoryCollectionViewCell.swift
//  DeliveryTest
//
//  Created by Дмитрий Садырев on 14.10.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 16
        layer.borderColor = Constants.categoryColor.cgColor.copy(alpha: 0.4)
    }
    
    func setLabel(_ text: String) {
        label.text = text
    }
    
    func setSelectedStyle(isSelected: Bool) {
        if isSelected == true {
            layer.borderWidth = 0
            layer.backgroundColor = Constants.categoryColor.cgColor.copy(alpha: 0.2)
            label.textColor = Constants.categoryColor
            label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        } else {
            layer.borderWidth = 1
            layer.backgroundColor = .none
            label.textColor = Constants.categoryColor.withAlphaComponent(0.4)
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
    }
}
