//
//  CustomTabbarViewController.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 01/12/2022.
//

import UIKit

class CustomTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self = ExampleProvider.customMoreStyle()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
