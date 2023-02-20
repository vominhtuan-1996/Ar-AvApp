//
//  HeaderView.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 17/02/2023.
//

import UIKit

class HeaderView: UIView {
    var contentView: UIView!
    var leftMenuButton: UIButton!
    var shoppingBagButton:UIButton!
    var searchButton:UIButton!
    var logoImageView:UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
        self .addSubview(self .setUpUILeftButton())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
        self .addSubview(self .setUpUILeftButton())
        self .addSubview(self .setUpUIRightButton())
        self .addSubview(self .setUpSearchButton())
        self.addSubview(self .setUplogoView())
    }
    // MARK: UILeftButton
    
    func setUpUILeftButton() -> UIButton {
        self.leftMenuButton = UIButton.init(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        self.leftMenuButton.backgroundColor = UIColor.clear
        self.leftMenuButton.setImage(UIImage.init(named: "ic_leftMenu"), for: .normal)
        self.leftMenuButton.addTarget(self, action: #selector(leftButtonACtion), for: .touchUpInside)
        return self.leftMenuButton
    }
    
    @objc func leftButtonACtion() {
        
    }
    
    // MARK: UIRightButton
    
    func setUpUIRightButton() -> UIButton {
        self.shoppingBagButton = UIButton.init(frame: CGRect(x: self.frame.width - 60, y: 0, width: 60, height: 60))
        self.shoppingBagButton.backgroundColor = UIColor.clear
        self.shoppingBagButton.setImage(UIImage.init(named: "ic_shopping_bag"), for: .normal)
        self.shoppingBagButton.addTarget(self, action: #selector(ShoppingBagAction), for: .touchUpInside)
        return self.shoppingBagButton
    }
    
    @objc func ShoppingBagAction() {
        
    }
    
    // MARK: SearchButton
    
    func setUpSearchButton() -> UIButton {
        self.searchButton = UIButton.init(frame: CGRect(x: self.frame.width -  self.shoppingBagButton.frame.width - 40, y: 0, width: 60, height: 60))
        self.searchButton.backgroundColor = UIColor.clear
        self.searchButton.setImage(UIImage.init(named: "ic_search"), for: .normal)
        self.searchButton.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
        return self.searchButton
    }
    
    @objc func searchButtonAction() {
        
    }
    
    // MARK:
    
    func setUplogoView() -> UIView {
        self.contentView = UIView.init(frame: CGRect(x: UIScreen.screenWidth / 2 - 50, y: 0, width: 100, height: 60))
        self.contentView .addSubview(self.setUpUILogoImageView())
        self.contentView.backgroundColor = UIColor.clear;
        return self.contentView
    }
    
    func setUpUILogoImageView() -> UIImageView {
        self.logoImageView = UIImageView.init(frame:CGRect(x: 0, y: 0, width: 100, height: 60))
        self.logoImageView.image = UIImage.init(named: "logo")
        self.logoImageView.contentMode = .center
        return self.logoImageView
    }
}
