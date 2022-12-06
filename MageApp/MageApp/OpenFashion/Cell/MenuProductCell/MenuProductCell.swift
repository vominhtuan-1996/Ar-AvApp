//
//  MenuProductCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 05/12/2022.
//

import UIKit

class MenuProductCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var menuArrivalCollectionView: UICollectionView!
    @IBOutlet weak var loadmoreButton: UIButton!
    @IBOutlet weak var cartProductCollectionView: UICollectionView!
    let lessonTitles = ["All", "Apparel","Dress", "Tshirt","Bag",]
    override func awakeFromNib() {
        super.awakeFromNib()
        self .initUIcartProductCollectionView()
        self .initUImenuArrivalCollectionView()
        // Initialization code
    }
    
    func initUImenuArrivalCollectionView() {
        self.menuArrivalCollectionView .registerCell(nibName: "MenuArrivalItemCell")
        self.menuArrivalCollectionView.delegate = self
        self.menuArrivalCollectionView.dataSource = self
        self.menuArrivalCollectionView.bounces = false
        self.menuArrivalCollectionView .reloadData()
    }
    
    func initUIcartProductCollectionView() {
        self.cartProductCollectionView .registerCell(nibName: "CartItemCollectionViewCell")
        self.cartProductCollectionView.delegate = self
        self.cartProductCollectionView.dataSource = self
        self.cartProductCollectionView.bounces = false
        self.cartProductCollectionView .reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.menuArrivalCollectionView) {
            return lessonTitles.count
        } else if (collectionView == self.cartProductCollectionView) {
            return 4
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == self.menuArrivalCollectionView) {
            let MenuArrivalItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuArrivalItemCell", for: indexPath) as! MenuArrivalItemCell
            MenuArrivalItemCell.titlelabel.text  = lessonTitles[indexPath.row]
            return MenuArrivalItemCell
        } else if (collectionView == self.cartProductCollectionView) {
            let CartItemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartItemCollectionViewCell", for: indexPath) as! CartItemCollectionViewCell
            return CartItemCollectionViewCell
        }
        return collectionView.dequeueReusableCell(withReuseIdentifier: "MenuArrivalItemCell", for: indexPath) as! MenuArrivalItemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == self.menuArrivalCollectionView) {
            var col:Int = 0
            col = lessonTitles.count - col
            let w = (Int(collectionView.frame.size.width) - (20 * col)) / col;
            let size = CGSizeMake(CGFloat(w), 36);
            return size;
        } else if  (collectionView == self.cartProductCollectionView) {
            let w = (Int(collectionView.frame.size.width) - 10) / 2
            let size = CGSizeMake(CGFloat(w), 280);
            return size;
        }
        return CGSize.zero
    }
}
