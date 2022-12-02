//
//  RootViewController.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 01/12/2022.
//

import UIKit
import ESTabBarController_swift
class RootViewController: UIViewController {

    @IBOutlet weak var tabbarView: ESTabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
//        self.tabbarView.barStyle = ExampleProvider.customMoreStyle()
        // Do any additional setup after loading the view.
    }
    
}
