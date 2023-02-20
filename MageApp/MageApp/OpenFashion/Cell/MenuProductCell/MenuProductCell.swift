//
//  MenuProductCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 05/12/2022.
//

import UIKit
import UIView_Shimmer
class MenuProductCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ShimmeringViewProtocol {
    @IBOutlet weak var menuArrivalCollectionView: UICollectionView!
    @IBOutlet weak var loadmoreButton: UIButton!
    @IBOutlet weak var cartProductCollectionView: UICollectionView!
    var lessonTitles:[collectionTitleModel] = []
    var arrival:ArrivalModel = ArrivalModel()
    var shimmeringAnimatedItems: [UIView] {
        [
            menuArrivalCollectionView,
            loadmoreButton,
            cartProductCollectionView,
        ]
    }
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
    
    func setDataforMenuProductCell(arrival:ArrivalModel) {
        self.arrival = arrival
        self.lessonTitles = arrival.collectionTitle
        self.menuArrivalCollectionView .reloadData()
        self.cartProductCollectionView .reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.menuArrivalCollectionView) {
            return self.lessonTitles.count
        } else if (collectionView == self.cartProductCollectionView) {
            return self.arrival.cartItem.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == self.menuArrivalCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuArrivalItemCell", for: indexPath) as! MenuArrivalItemCell
            cell.setDataForMenuArrivalItemCell(data: self.lessonTitles[indexPath.row])
            return cell
        } else if (collectionView == self.cartProductCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartItemCollectionViewCell", for: indexPath) as! CartItemCollectionViewCell
            cell .setDataforCartItemCollectionViewCell(data: self.arrival.cartItem[indexPath.row])
            return cell
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
            let size = CGSizeMake(CGFloat(w), 300);
            return size;
        }
        return CGSize.zero
    }
}
