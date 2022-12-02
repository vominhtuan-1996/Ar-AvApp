//
//  TableViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 02/12/2022.
//

import UIKit

class TableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var imageCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self .initUIimageCollectionView()
    }

    func initUIimageCollectionView() {
        self.imageCollectionView.delegate = self;
        self.imageCollectionView.dataSource = self;
        self.imageCollectionView .registerCell(nibName: "CollectionViewCell")
        self.imageCollectionView .reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:UIScreen.screenWidth , height: 600)
    }
    
}
