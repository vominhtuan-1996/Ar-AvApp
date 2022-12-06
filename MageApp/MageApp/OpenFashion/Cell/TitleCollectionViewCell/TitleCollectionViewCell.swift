//
//  TitleCollectionViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 06/12/2022.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDataForCellWithTitle(title:String) {
        self.containerView.backgroundColor = UIColor.init(rgb: 0xF9F9F9)
        self.containerView.formatBorder(borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 14)
        self.titleLabel.text = title
    }
}
