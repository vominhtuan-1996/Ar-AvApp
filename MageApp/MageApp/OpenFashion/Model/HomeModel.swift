//
//  HomeModel.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 08/12/2022.
//

import UIKit

class HomeModel {
    var items: [Any] = []
    var listObjectBanner:[linkImageModel] = []
    var ArrivalModels:ArrivalModel = ArrivalModel()
    var listBrand:[ListBrandModel] = []
    func parseDataForHomeModelWithDictionary(dict:[NSDictionary]) -> HomeModel{
        let model = HomeModel()
        for itemmodel:NSDictionary in dict {
            if itemmodel["listObjectBanner"] != nil {
                for itemlinkImageModel in itemmodel["listObjectBanner"] as! [Any] {
                    model.listObjectBanner.append(linkImageModel() .parseDataForlinkImageModelWithDictionary(dict: itemlinkImageModel as! NSDictionary))
                }
            } else if itemmodel["listBrand"] != nil {
                for listBrandItem in itemmodel["listBrand"] as! [Any] {
                    model.listBrand.append(ListBrandModel() .pareDataListBrandModel(dict: listBrandItem as! NSDictionary))
                }
            } else {
                model.ArrivalModels = ArrivalModel() .parseDataForArrivalModelWithDictionary(dict: itemmodel)
            }
        }
        model.items = dict
        return model
    }
}

class linkImageModel {
    var linkImage:String = ""
    func parseDataForlinkImageModelWithDictionary(dict:NSDictionary) -> linkImageModel {
        let model = linkImageModel()
        model.linkImage = dict["linkImage"] as! String
        return model
    }
}

class ArrivalModel {
    var Title: String = ""
    var collectionTitle: [collectionTitleModel] = []
    var cartItem: [listProductModel] = []
    
    func parseDataForArrivalModelWithDictionary(dict:NSDictionary) -> ArrivalModel {
        let model = ArrivalModel()
        model.Title = dict["Title"] as! String
        for itemlessonTitles in dict["lessonTitles"] as! [NSDictionary] {
            model.collectionTitle.append(collectionTitleModel() .parseDataForCollectionTitleModel(dict: itemlessonTitles))
        }
        for cartItem in dict["cartItem"] as! [NSDictionary] {
            model.cartItem.append(listProductModel() .pareDataForListProductModel(dict: cartItem))
        }
        return model
    }
}

class collectionTitleModel {
    var title:String = ""
    var selected:Bool = true
    
    func parseDataForCollectionTitleModel(dict:NSDictionary) -> collectionTitleModel {
        let model = collectionTitleModel()
        model.title = dict["title"] as! String
        model.selected = dict["selected"] as! Bool
        return model
    }
}

class listProductModel {
    var linkImage:String = ""
    var Description:String = ""
    var Price:Int = 0
    
    func pareDataForListProductModel(dict:NSDictionary) -> listProductModel {
        let model = listProductModel()
        model.linkImage = dict["linkImage"] as! String
        model.Description = dict["Description"] as! String
        model.Price = dict["Price"] as! Int
        return model
    }
}

class ListBrandModel {
    var id:String = ""
    var brandName:String = ""
    
    func pareDataListBrandModel(dict:NSDictionary) -> ListBrandModel {
        let model = ListBrandModel()
        model.id = dict["id"] as! String
        model.brandName = dict["brandName"] as! String
        return model
    }
    
}

struct collectionsModel:Decodable {
    let HeaderImageLink:String
    let UutumnImageLink:String
    
}

struct VideoLink:Decodable {
    let linkVideo:String
}

struct ListTrending:Decodable {
    
}

struct FollowUsModel:Decodable {
    let userId:String
    let userName:String
    let avartar:String
}
