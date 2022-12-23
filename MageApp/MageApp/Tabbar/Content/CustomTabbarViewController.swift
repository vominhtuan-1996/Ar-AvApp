//
//  CustomTabbarViewController.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 01/12/2022.
//

import UIKit
import ESTabBarController_swift
class CustomTabbarViewController: ESTabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Example"
        self .setupUITabbar()
    }
    func setupUITabbar() {
        let v1 = self .OpenFashionHomeViewControler()
        let v2 = ChatGPTViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        v1.tabBarItem = ESTabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: nil, image: UIImage(named: "photo_verybig"), selectedImage: UIImage(named: "photo_verybig"))
        v4.tabBarItem = ESTabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        self.viewControllers = [v1, v2, v3, v4, v5]
    }

    func OpenFashionHomeViewControler() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "FashionHomeViewController")
    }
    
//    func openChatGPTControler() -> UIViewController {
//        <#function body#>
//    }
}
