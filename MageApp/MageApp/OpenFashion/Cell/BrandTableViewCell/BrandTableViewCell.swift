//
//  BrandTableViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 05/12/2022.
//

import UIKit

class BrandTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var brandCollectionView: UICollectionView!
    let brandList = ["Prada", "Burberry@2x","Boss", "Catier","Gucci","Tiffany&Co"]
    override func awakeFromNib() {
        super.awakeFromNib()
        self .initUIbrandCollectionView()
    }
    func initUIbrandCollectionView() {
        self.brandCollectionView .registerCell(nibName: "CollectionViewCell")
        self.brandCollectionView.delegate = self
        self.brandCollectionView.dataSource = self
        self.brandCollectionView.bounces = false
        self.brandCollectionView .reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brandList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let MenuArrivalItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        MenuArrivalItemCell.productImageView.image  = UIImage.init(named: brandList[indexPath.row])
        return MenuArrivalItemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (Int(collectionView.frame.size.width) / 3 - (3 * 10));
        let size = CGSizeMake(CGFloat(w), 30);
        return size;
    }
}
