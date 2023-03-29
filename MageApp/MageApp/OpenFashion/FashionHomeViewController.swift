//
//  FashionHomeViewController.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 02/12/2022.
//

import UIKit
import UIView_Shimmer
import Alamofire

class FashionHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var homeTableView: UITableView!
    var homePageModel = HomeModel()
    private var isLoading = true {
        didSet {
            self.homeTableView.isUserInteractionEnabled = !isLoading
            self.homeTableView.reloadData()
        }
    }
    var tableViewCell = TableViewCell()
    override func viewDidLoad() {
        super.viewDidLoad()
//        SVProgressHUD.show();
        isLoading = true
        self .initUITableView()
        self .fecthData()
        let name = Defaults.getNameAndPassWord().name
        
    }
    
    // MARK: fecthData
    
    func fecthData() {
        let body: [String : Any] = [:]
        MegaHttps(data: body, url: .MobiMap,service: .getDataHomePage,method: .get,isJSONRequest: false).executeQuery { errorCode, message, result in
            if (errorCode == 0) {
                self.homePageModel = HomeModel() .parseDataForHomeModelWithDictionary(dict: result as! [NSDictionary])
                self.isLoading = false
            }
            self.homeTableView .reloadData()
        } erroreHanders: { error in
            //
        }
    }
    
    
    func initUITableView(){
        self.homeTableView .registerCell(nibName: "TableViewCell")
        self.homeTableView .registerCell(nibName: "MenuProductCell")
        self.homeTableView .registerCell(nibName: "BrandTableViewCell")
        self.homeTableView .registerCell(nibName: "CollectionsCell")
        self.homeTableView .registerCell(nibName: "VideoTableViewCell")
        self.homeTableView .registerCell(nibName: "ProductTableViewCell")
        self.homeTableView .registerCell(nibName: "TrendingTableViewCell")
        self.homeTableView .registerCell(nibName: "OpenFashionTableViewCell")
        self.homeTableView .registerCell(nibName: "FollowTableViewCell")
        self.homeTableView .registerCell(nibName: "FooterTableViewCell")
        self.homeTableView.delegate = self;
        self.homeTableView.dataSource = self;
        self.homeTableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homePageModel.items.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            cell.selectionStyle = .none
            cell.setDataForTableViewCell(listDownloadimage: self.homePageModel.listObjectBanner)
            cell.setTemplateWithSubviews(false)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuProductCell") as! MenuProductCell
            cell.setDataforMenuProductCell(arrival: self.homePageModel.ArrivalModels)
            cell.selectionStyle = .none
            cell.setTemplateWithSubviews(false)
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BrandTableViewCell") as! BrandTableViewCell
            cell .setDataForBrandCollectionView(data: self.homePageModel.listBrand)
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionsCell") as! CollectionsCell
            cell .setDataForCollectionsCell(data: self.homePageModel.collection)
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell") as! VideoTableViewCell
            cell.selectionStyle = .none
            cell .initPlayVideo(link: self.homePageModel.linkVideo)
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
            cell .setDataForProductTableViewCell(data: self.homePageModel.justForyou)
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingTableViewCell") as! TrendingTableViewCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OpenFashionTableViewCell") as! OpenFashionTableViewCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 8 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FollowTableViewCell") as! FollowTableViewCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FooterTableViewCell") as! FooterTableViewCell
            cell.selectionStyle = .none
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        /*
         Shimmering animation take the superviews' background color.
         
         So you can set background color to parent:
         cell.contentView.backgroundColor = .white
         
         or specify it with `viewBackgroundColor` parameter.
         */
        cell.setTemplateWithSubviews(isLoading, animate: true, viewBackgroundColor: .systemBackground)
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
        } else if indexPath.row == 7 {
            return 487
        } else if indexPath.row == 8 {
            return 477
        } else if indexPath.row == 9 {
            return 358
        } else {
            return 0
        }
    }
}

extension UITableView: ShimmeringViewProtocol { }
