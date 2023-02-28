//
//  CollectionsCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 06/12/2022.
//

import UIKit
import SDWebImage
class CollectionsCell: UITableViewCell {

    @IBOutlet weak var uutumnImageView: UIImageView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func setDataForCollectionsCell(data:collectionsModel) {
        self.titleLabel.text = data.title;
        self.headerImageView .sd_setImage(with: URL(string: data.HeaderImageLink), placeholderImage: UIImage(named: "Banner.png"))
        self.uutumnImageView .sd_setImage(with: URL(string: data.UutumnImageLink), placeholderImage: UIImage(named: "Banner.png"))
    }
}
