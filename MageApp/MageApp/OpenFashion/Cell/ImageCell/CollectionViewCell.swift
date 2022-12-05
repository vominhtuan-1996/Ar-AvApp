//
//  CollectionViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 02/12/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension CollectionViewCell {
    func calculateHeightCell() -> CGFloat {
        return 600
    }
}
