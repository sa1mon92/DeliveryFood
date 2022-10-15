//
//  MealsTableViewCell.swift
//  DeliveryTest
//
//  Created by Дмитрий Садырев on 14.10.2022.
//

import UIKit
import SDWebImage

class MealsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var priveView: UIView!
    @IBOutlet weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        descriptionTextView.textContainerInset = UIEdgeInsets.zero
        descriptionTextView.textContainer.lineFragmentPadding = 0
        priveView.layer.cornerRadius = 6
        priveView.layer.borderWidth = 1
        priveView.layer.borderColor = CGColor(red: 253 / 255, green: 58 / 255, blue: 105 / 255, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(model: Meal?) {
        mealImage.sd_setImage(with: URL(string: model!.imageURL), placeholderImage: UIImage(systemName: "photo"))
        titleLabel.text = model?.name ?? ""
        descriptionTextView.text = model?.description ?? ""
        if let price = model?.price {
            priceLabel.text = "от \(String(describing: price)) р"
        }
    }
    
}
