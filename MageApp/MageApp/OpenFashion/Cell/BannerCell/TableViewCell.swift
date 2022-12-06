//
//  TableViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 02/12/2022.
//

import UIKit

class TableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var imageCollectionView: UICollectionView!
    var collectionView = CollectionViewCell()
    
    let listDownloadimage = ["https://assets.vogue.in/photos/5f69dc6ca58c74ba85c91d30/master/w_1600,c_limit/shivan%20and%20narresh%20couture.jpeg",
                             "https://images.pexels.com/photos/1926769/pexels-photo-1926769.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                             "https://images.pexels.com/photos/1055691/pexels-photo-1055691.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                             "https://images.pexels.com/photos/884979/pexels-photo-884979.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"]
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
        self.collectionView .setImageForCellWithLink(link: self.listDownloadimage[indexPath.row])
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
