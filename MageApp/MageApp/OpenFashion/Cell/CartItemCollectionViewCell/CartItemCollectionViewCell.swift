//
//  CartItemCollectionViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 05/12/2022.
//

import UIKit
import SDWebImage

class CartItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setDataforCartItemCollectionViewCell(data:listProductModel) {
        self.cartImageView.sd_setImage(with: URL(string:data.linkImage), placeholderImage: UIImage(named: "Banner.png"))
        self.priceLabel.text = String(format: "$%ld", data.Price)
        self.titleLabel.text = data.Description
    }

}
