//
//  TicToeCollectionViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 30/03/2023.
//

import UIKit
protocol TicToeCollectionViewCellDelegate: AnyObject {
    func ClearDataUserModel()
}
class TicToeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tictoeImageView: UIImageView!
    var delegate:TicToeCollectionViewCellDelegate? = nil
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setUITicToeCollectionViewCell(index:IndexPath,user:UserPlayer , countSelected:Int){
        self.tictoeImageView.image = nil
        if (user.player2) {
            if (user.listIndexPlayer1.count > 0) {
                let userSelected = user.listIndexPlayer1.lastObject as! UserSelectedModel
                if (index.row == userSelected.index) {
                    self.tictoeImageView.image = UIImage(named: "ic_close")
                }
            }
        } else {
            if (user.listIndexPlayer2.count > 0) {
                let userSelected = user.listIndexPlayer2.lastObject as! UserSelectedModel
                if (index.row == userSelected.index) {
                    self.tictoeImageView.image = UIImage(named: "ic_circle")
                }
            }
        }
        if (index.row % 2 == 0) {
            self.backgroundColor = UIColor.lightGray
        } else {
            self.backgroundColor = UIColor.gray
        }
        self.winningCombinations.forEach { arrayInt in
            var arrayIndexSelectd:[Int] = []
            if (user.player2) {
                user.listIndexPlayer1.forEach { it in
                    let userSelected = it as! UserSelectedModel
                    arrayInt.forEach { i in
                        if (i == userSelected.index) {
                            arrayIndexSelectd.append(userSelected.index)
                        }
                    }
                }
            } else {
                user.listIndexPlayer2.forEach { it in
                    let userSelected = it as! UserSelectedModel
                    arrayInt.forEach { i in
                        if (i == userSelected.index) {
                            arrayIndexSelectd.append(userSelected.index)
                        }
                    }
                }
            }
            if (arrayInt.containsSameElements(as: arrayIndexSelectd)) {
                MegaAppHelper() .openAlertControllerWithControler(controller: nil,
                                                                  title: "Thông báo",
                                                                  message: user.player2 ? "Người chiến thắng là Player 1" : "Người chiến thắng là Player 2",
                                                                  styleAlert: .alert,
                                                                  yesTitle: "Đồng ý",
                                                                  styleYesAction: .default,
                                                                  handerYesAction: { _ in
                    if (self.delegate != nil) {
                        self.delegate! .ClearDataUserModel()
                    }
                }, NoTitle: nil, styleNoAction: nil, handerNoAction: nil)
            } else {
                if (countSelected == 9) {
                    MegaAppHelper() .openAlertControllerWithControler(controller: nil,
                                                                      title: "Thông báo",
                                                                      message: "Hòa",
                                                                      styleAlert: .alert,
                                                                      yesTitle: "Đồng ý",
                                                                      styleYesAction: .default,
                                                                      handerYesAction: { _ in
                        if (self.delegate != nil) {
                            self.delegate! .ClearDataUserModel()
                        }
                    }, NoTitle: nil, styleNoAction: nil, handerNoAction: nil)
                }
            }
        }
    }
}
