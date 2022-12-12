//
//  TableViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 02/12/2022.
//

import UIKit
import UIView_Shimmer

class TableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ShimmeringViewProtocol {
    @IBOutlet weak var imageCollectionView: UICollectionView!
    var collectionView = CollectionViewCell()
//    var shimmeringAnimatedItems: [UIView] {
//        [
//            imageCollectionView
//        ]
//    }
    var listDownloadimage:NSMutableArray = []
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
        return self.listDownloadimage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.collectionView = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        self.collectionView .setImageForCellWithLink(link: self.listDownloadimage[indexPath.row] as! String)
        return self.collectionView
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:UIScreen.screenWidth , height: 600)
    }
}

extension TableViewCell {
    func calcuHeightCell() -> CGFloat {
        return CollectionViewCell .calculateHeightCell(self.collectionView)()
    }
}
