//
//  Extention.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 02/12/2022.
//

import UIKit

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

extension UITableView {
    func registerCell(nibName:String) {
        self.register(UINib(nibName: nibName, bundle: Bundle.main), forCellReuseIdentifier: nibName)
    }
}

extension UICollectionView {
    func registerCell(nibName:String) {
        self.register(UINib(nibName: nibName, bundle: Bundle.main), forCellWithReuseIdentifier: nibName)
    }
}

extension UIScreen {
    class var screenWidth:CGFloat {
        get {
            return UIScreen.main.bounds.size.width
        }
    }
    
    class var screenHeight:CGFloat {
        get {
            return UIScreen.main.bounds.size.height
        }
    }
}

extension UIButton {
    func addRightIcon(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        let length = CGFloat(15)
        titleEdgeInsets.right += length
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.titleLabel!.trailingAnchor, constant: 10),
            imageView.centerYAnchor.constraint(equalTo: self.titleLabel!.centerYAnchor, constant: 0),
            imageView.widthAnchor.constraint(equalToConstant: length),
            imageView.heightAnchor.constraint(equalToConstant: length)
        ])
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}

extension UIView {
    func formatBorder(borderWidth : CGFloat, borderColor: UIColor ,cornerRadius: CGFloat)  {
        self.layer.cornerRadius = cornerRadius;
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}
