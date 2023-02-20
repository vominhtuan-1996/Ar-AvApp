//
//  MenuArrivalItemCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 05/12/2022.
//

import UIKit

class MenuArrivalItemCell: UICollectionViewCell {

    @IBOutlet weak var rectangleImageView: UIImageView!
    @IBOutlet weak var titlelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDataForMenuArrivalItemCell(data:collectionTitleModel) {
        self.titlelabel.text = data.title
        self.rectangleImageView.isHidden = !data.selected
    }

}
