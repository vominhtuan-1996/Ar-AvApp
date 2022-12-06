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
        self.headerImageView .sd_setImage(with: URL(string: "https://tpny.vn/wp-content/uploads/2021/03/background-dep-danh-cho-may-tinh.jpg"), placeholderImage: UIImage(named: "Banner.png"))
        self.uutumnImageView .sd_setImage(with: URL(string: "https://tpny.vn/wp-content/uploads/2021/03/Background-dep-thanh-pho.jpg"), placeholderImage: UIImage(named: "Banner.png"))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
