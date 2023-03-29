//
//  Helper.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 29/03/2023.
//

import Foundation
import UIKit
@objc class MegaAppHelper: NSObject {
    func openAlertControllerWithControler(controller:UIViewController,
                                          title:String?,
                                          message:String?,
                                          styleAlert:UIAlertController.Style,
                                          yesTitle:String?,
                                          styleYesAction:UIAlertAction.Style,
                                          handerYesAction:((UIAlertAction) -> Void)?,
                                          NoTitle:String?,
                                          styleNoAction:UIAlertAction.Style?,
                                          handerNoAction:((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: styleAlert)
        alertController.addAction(UIAlertAction(title: yesTitle, style: styleYesAction, handler: handerYesAction))
        if (NoTitle != nil) {
            alertController.addAction(UIAlertAction(title: NoTitle, style: styleNoAction!, handler: handerNoAction))
        }
        controller .present(alertController, animated: true)
    }
}


