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
        // Initialization code
        self.cartImageView.sd_setImage(with: URL(string: "https://mondaycareer.com/wp-content/uploads/2020/11/background-%C4%91%E1%BA%B9p-1-1024x768.jpg"), placeholderImage: UIImage(named: "Banner.png"))
//        self.cartImageView sd
    }

}
