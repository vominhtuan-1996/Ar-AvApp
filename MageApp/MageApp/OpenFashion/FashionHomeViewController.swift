//
//  FashionHomeViewController.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 02/12/2022.
//

import UIKit

class FashionHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var homeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self .initUITableView()
        // Do any additional setup after loading the view.
    }
    
    func initUITableView(){
        self.homeTableView .registerCell(nibName: "TableViewCell")
        self.homeTableView .registerCell(nibName: "MenuProductCell")
        self.homeTableView .registerCell(nibName: "BrandTableViewCell")
        self.homeTableView.delegate = self;
        self.homeTableView.dataSource = self;
        self.homeTableView.separatorStyle = .none
        self.homeTableView .reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            // Set up cell.label
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuProductCell") as! MenuProductCell
            // Set up cell.button
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BrandTableViewCell") as! BrandTableViewCell
            // Set up cell.textField
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            // Set up cell.label
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 600
        } else if indexPath.row == 1 {
            return 800
        } else if indexPath.row  == 2 {
            return 180
        } else {
            return 0
        }
    }
}
