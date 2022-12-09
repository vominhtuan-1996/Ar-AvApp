//
//  FollowTableViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 07/12/2022.
//

import UIKit

class FollowTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var followCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self .initUIfollowCollectionView()
    }

    func initUIfollowCollectionView() {
        self.followCollectionView .registerCell(nibName: "FollowCollectionViewCell")
        self.followCollectionView.delegate = self
        self.followCollectionView.dataSource = self
        self.followCollectionView.bounces = false
        self.followCollectionView .reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FollowCollectionViewCell", for: indexPath) as! FollowCollectionViewCell
//        cell .setDataForCellWithTitle(title: self.listTrending[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (Int(collectionView.frame.size.width) - 10) / 2
        let size = CGSizeMake(CGFloat(w), CGFloat(w));
        return size;
    }
    
}
