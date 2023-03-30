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
    var collection:collectionsModel = collectionsModel()
    var linkVideo:String = ""
    var justForyou = JustForYou()
    
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
            } else if itemmodel["collection"] != nil {
                model.collection = collectionsModel() .parseDatacollectionsModel(dict: itemmodel["collection"] as! NSDictionary)
            } else if itemmodel["linkVideo"] != nil {
                model.linkVideo = itemmodel["linkVideo"] as! String
            } else if itemmodel["justforyou"] != nil  {
                model.justForyou = JustForYou() .parseDataJustForYouModel(dict: itemmodel["justforyou"] as! NSDictionary)
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

class collectionsModel {
    var title:String = ""
    var HeaderImageLink:String = ""
    var UutumnImageLink:String = ""
    
    func parseDatacollectionsModel(dict:NSDictionary) -> collectionsModel {
        let model = collectionsModel()
        model.title = dict["title"] as! String
        model.HeaderImageLink = dict["HeaderImageLink"] as! String
        model.UutumnImageLink = dict["UutumnImageLink"] as! String
        return model
    }
}

class VideoLink {
    var linkVideo:String = ""
    
    func parseDataVideoLinkModel(dict:NSDictionary) -> VideoLink {
        let model = VideoLink()
        model.linkVideo = dict["linkVideo"] as! String
        return model
    }
}

class JustForYou {
    var title = ""
    var item:[listProductModel] = []
    func parseDataJustForYouModel(dict:NSDictionary) -> JustForYou {
        let model = JustForYou()
        model.title = dict["title"] as! String
        for Item in dict["item"] as! [NSDictionary] {
            model.item.append(listProductModel() .pareDataForListProductModel(dict: Item))
        }
        return model
    }
    
}

struct ListTrending:Decodable {
    
}

struct UserPlayer {
    var player1:Bool
    var player2:Bool
    var listIndexPlayer1:NSMutableArray = []
    var listIndexPlayer2:NSMutableArray = []
    
    mutating func ClearData() {
        self.player1 = true
        self.player2 = false
        self.listIndexPlayer1 .removeAllObjects()
        self.listIndexPlayer2 .removeAllObjects()
    }
}

struct UserSelectedModel {
    var index:Int
    var imageName:String
}
