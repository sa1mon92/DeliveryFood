//
//  TopSaleCollectionViewCell.swift
//  DeliveryTest
//
//  Created by Дмитрий Садырев on 14.10.2022.
//

import UIKit
import SDWebImage

class TopSaleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
    }
    
    func setImage(_ image: UIImage) {
        self.image.image = image
    }
    
    func setup(model: MenuModel.TopSale?) {
        guard let model = model else { return }
        
        image.sd_setImage(with: URL(string: model.imageURL), placeholderImage: UIImage(systemName: "photo"))
    }
    
    func setOpacity(xPosition: CGFloat, cellWidth: CGFloat) {
        let screenWidth = UIScreen.main.bounds.width
        if xPosition < 0 {
            let alpha = 1 - (xPosition / -(cellWidth / 2))
            image.alpha = alpha
        } else if xPosition > screenWidth {
            let alpha = 1 - ((xPosition - screenWidth) / (cellWidth / 2))
            image.alpha = alpha
        }
    }
}
