//
//  ProductTableViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 06/12/2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productCollectionView: UICollectionView!
    var listItem:[listProductModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self .initUIproductCollectionView()
    }
    func initUIproductCollectionView() {
        self.productCollectionView .registerCell(nibName: "CartItemCollectionViewCell")
        self.productCollectionView.delegate = self
        self.productCollectionView.dataSource = self
        self.productCollectionView.bounces = false
        self.productCollectionView .reloadData()
    }
    
    func setDataForProductTableViewCell(data:JustForYou) {
        self.titleLabel.text = data.title;
        self.listItem = data.item
        self.productCollectionView .reloadData()
    }
    
    // MARK: collectionDelegate & collectionDdtaSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartItemCollectionViewCell", for: indexPath) as! CartItemCollectionViewCell
        cell .setDataforCartItemCollectionViewCell(data: self.listItem[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSizeMake(255, 390);
        return size;
    }
    
}
