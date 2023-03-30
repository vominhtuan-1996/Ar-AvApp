//
//  TicToeViewController.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 30/03/2023.
//

import UIKit
import AnimatedCollectionViewLayout

@available(iOS 16.0, *)
class TicToeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,TicToeCollectionViewCellDelegate {
    func ClearDataUserModel() {
        self.countSelected = 0
        self.userModel .ClearData()
        self.tictoeCollectionView .reloadData()
    }
    
   
    @IBOutlet weak var playButton: UIButton!
    var userModel = UserPlayer(player1: true, player2: false)
    var countSelected:Int = 0
    @IBOutlet weak var tictoeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self .initUITictoeCollectionView()
        self.tictoeCollectionView .Contactshadows(size: 50, shadowOpacity: 1, shadowColor: UIColor.lightGray)
        self.playButton .formatBorder(borderWidth: 1, borderColor: self.playButton.backgroundColor!, cornerRadius: 16)
    }
    
    func initUITictoeCollectionView() {
        let layout = CollectionViewCenteredFlowLayout()
        self.tictoeCollectionView.collectionViewLayout = layout
        self.tictoeCollectionView.backgroundColor = UIColor.blue
        self.tictoeCollectionView .registerCell(nibName: "TicToeCollectionViewCell")
        self.tictoeCollectionView.delegate = self
        self.tictoeCollectionView.dataSource = self
        self.tictoeCollectionView.bounces = false
        self.tictoeCollectionView .reloadData()
    }
    
  
    
    // MARK: CollectionDelegate && CollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tictoeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TicToeCollectionViewCell", for: indexPath) as! TicToeCollectionViewCell
        tictoeCell .setUITicToeCollectionViewCell(index: indexPath, user: self.userModel,countSelected: self.countSelected)
        tictoeCell.delegate = self
        return tictoeCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.size.width / 3, height: collectionView.frame.size.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.countSelected = self.countSelected + 1
        var isAddObject:Bool = true
        if (self.userModel.player1) {
            if (self.userModel.listIndexPlayer1.count > 0) {
                self.userModel.listIndexPlayer1.forEach { it in
                    let userSelected = it as! UserSelectedModel
                    if (userSelected.index == indexPath.row) {
                        isAddObject = false
                    }
                }
                if (isAddObject) {
                    self.userModel.listIndexPlayer1.add(UserSelectedModel(index: indexPath.row, imageName: "ic_close"))
                } else {
                    return
                }
            } else {
                self.userModel.listIndexPlayer1.add(UserSelectedModel(index: indexPath.row, imageName: "ic_close"))
            }
            if (self.userModel.listIndexPlayer2.count > 0) {
                self.userModel.listIndexPlayer2.forEach { it in
                    let userSelected = it as! UserSelectedModel
                    if (userSelected.index == indexPath.row) {
                        isAddObject = false
                    }
                }
                if (!isAddObject) {
                    return
                }
            }
            if (isAddObject) {
                self.userModel.player1 = false
                self.userModel.player2 = true
            }
        } else {
            if (self.userModel.listIndexPlayer2.count > 0) {
                self.userModel.listIndexPlayer2.forEach { it in
                    let userSelected = it as! UserSelectedModel
                    if (userSelected.index == indexPath.row) {
                        isAddObject = false
                    }
                }
                if (isAddObject) {
                    self.userModel.listIndexPlayer2.add(UserSelectedModel(index: indexPath.row, imageName: "ic_circle"))
                } else {
                    return
                }
            } else {
                self.userModel.listIndexPlayer2.add(UserSelectedModel(index: indexPath.row, imageName: "ic_circle"))
            }
            if (self.userModel.listIndexPlayer1.count > 0) {
                self.userModel.listIndexPlayer1.forEach { it in
                    let userSelected = it as! UserSelectedModel
                    if (userSelected.index == indexPath.row) {
                        isAddObject = false
                    }
                }
                if (!isAddObject) {
                    return
                }
            }
            if (isAddObject) {
                self.userModel.player1 = true
                self.userModel.player2 = false
            }
        }
        if (isAddObject) {
            collectionView .reloadItems(at: [indexPath])
        }
        
    }
    
    // MARK: ACtion
    
    @IBAction func playButton_TouchupInside(_ sender: Any) {
        self.userModel .ClearData()
        self.tictoeCollectionView .reloadData()
    }
    
    
}
