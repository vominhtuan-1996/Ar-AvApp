//
//  FashionHomeViewController.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 02/12/2022.
//

import UIKit

class FashionHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var homeTableView: UITableView!
    var tableViewCell = TableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self .initUITableView()
        // Do any additional setup after loading the view.
    }
    
    func initUITableView(){
        self.homeTableView .registerCell(nibName: "TableViewCell")
        self.homeTableView .registerCell(nibName: "MenuProductCell")
        self.homeTableView .registerCell(nibName: "BrandTableViewCell")
        self.homeTableView .registerCell(nibName: "CollectionsCell")
        self.homeTableView .registerCell(nibName: "VideoTableViewCell")
        self.homeTableView .registerCell(nibName: "ProductTableViewCell")
        self.homeTableView .registerCell(nibName: "TrendingTableViewCell")
        self.homeTableView.delegate = self;
        self.homeTableView.dataSource = self;
        self.homeTableView.separatorStyle = .none
        self.homeTableView .reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            self.tableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            self.tableViewCell.selectionStyle = .none
            return self.tableViewCell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuProductCell") as! MenuProductCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BrandTableViewCell") as! BrandTableViewCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionsCell") as! CollectionsCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell") as! VideoTableViewCell
            cell.selectionStyle = .none
            cell .initPlayVideo()
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingTableViewCell") as! TrendingTableViewCell
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            cell.selectionStyle = .none
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.tableViewCell .calcuHeightCell()
        } else if indexPath.row == 1 {
            return 766
        } else if indexPath.row  == 2 {
            return 180
        } else if indexPath.row == 3 {
            return 640
        } else if indexPath.row == 4 {
            return 257
        } else if indexPath.row == 5 {
            return 531
        } else if indexPath.row == 6 {
            return 140
        } else {
            return 0
        }
    }
}
