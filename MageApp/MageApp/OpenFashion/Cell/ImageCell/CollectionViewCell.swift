//
//  CollectionViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 02/12/2022.
//

import UIKit
import SDWebImage
class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setImageForCellWithLink(link:String) {
        self.productImageView .sd_setImage(with: URL(string: link), placeholderImage: UIImage(named: "Banner.png"))
    }
}

extension CollectionViewCell {
    func calculateHeightCell() -> CGFloat {
        return 600
    }
}
