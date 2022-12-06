//
//  TrendingTableViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 06/12/2022.
//

import UIKit

class TrendingTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var trendingCollectionView: UICollectionView!
    let listTrending = ["#2021","#spring","#collection","#fall","#dress","#autumncollection","#openfashion"]
    override func awakeFromNib() {
        super.awakeFromNib()
        self .initUItrendingCollectionView()
    }
    
    func initUItrendingCollectionView() {
        self.trendingCollectionView .registerCell(nibName: "TitleCollectionViewCell")
        self.trendingCollectionView.delegate = self
        self.trendingCollectionView.dataSource = self
        self.trendingCollectionView.bounces = false
        self.trendingCollectionView .reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listTrending.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCollectionViewCell", for: indexPath) as! TitleCollectionViewCell
        cell .setDataForCellWithTitle(title: self.listTrending[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let value = self.listTrending[indexPath.row]
        let sizeW = value.width(withConstrainedHeight: 32, font: UIFont (name: "TenorSans", size: 14)!) + 10
        let size = CGSizeMake(sizeW, 32);
        return size;
    }

}
