//
//  TableViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 02/12/2022.
//

import UIKit
import UIView_Shimmer
import AnimatedCollectionViewLayout

class TableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ShimmeringViewProtocol {
    @IBOutlet weak var imageCollectionView: UICollectionView!
    var collectionView = CollectionViewCell()
//    var shimmeringAnimatedItems: [UIView] {
//        [
//            imageCollectionView
//        ]
//    }
    var listDownloadimage:[linkImageModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        self .initUIimageCollectionView()
    }
    
    func setDataForTableViewCell(listDownloadimage:[linkImageModel]) {
        self.listDownloadimage = listDownloadimage
        self.imageCollectionView .reloadData()
    }

    func initUIimageCollectionView() {
        let layout = AnimatedCollectionViewLayout()
        layout.animator = SnapInAttributesAnimator()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        self.imageCollectionView.collectionViewLayout = layout
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
        self.collectionView .setImageForCellWithLink(link: self.listDownloadimage[indexPath.row].linkImage)
        return self.collectionView
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:UIScreen.screenWidth , height: 600)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("index",indexPath.row);
    }
}

extension TableViewCell {
    func calcuHeightCell() -> CGFloat {
        return CollectionViewCell .calculateHeightCell(self.collectionView)()
    }
}
