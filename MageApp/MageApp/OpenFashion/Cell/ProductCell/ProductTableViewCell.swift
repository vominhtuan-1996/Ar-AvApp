//
//  ProductTableViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 06/12/2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var productCollectionView: UICollectionView!
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let CartItemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartItemCollectionViewCell", for: indexPath) as! CartItemCollectionViewCell
        return CartItemCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSizeMake(255, 390);
        return size;
    }
    
}
