//
//  HomeModel.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 08/12/2022.
//

import UIKit

struct HomeModel: Decodable {
    var requestId: String
    var items: [ItemsModel]
    var count: String
    var anyKey: String
    
    enum ItemsModel:Decodable {
        enum DecodingError: Error {
            case wrongJSON
        }

        case headerImageLink([headerImageLinkModel])
        case Arrival(ArrivalModel)
        case ListBrand([ListBrandModel])
        case collections(collectionsModel)
        case linkVideo(String)
        case listProduct([listProductModel])
        case ListTrending([String])
        case OpenFashionSlogan(String)
        case FollowUs([FollowUsModel])
        enum CodingKeys: String, CodingKey {
            case headerImageLink = "headerImageLink"
            case Arrival = "Arrival"
            case ListBrand = "ListBrand"
            case collections = "collections"
            case linkVideo = "linkVideo"
            case listProduct = "listProduct"
            case ListTrending = "ListTrending"
            case OpenFashionSlogan = "OpenFashionSlogan"
            case FollowUs = "FollowUs"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            switch container.allKeys.first {
            case .headerImageLink:
                let value = try container.decode([headerImageLinkModel].self, forKey:.headerImageLink)
                print(value)
                self = .headerImageLink(value)
            case .Arrival:
                let value = try container.decode(ArrivalModel.self, forKey: .Arrival)
                print(value)
                self = .Arrival(value)
            case .ListBrand:
                let value = try container.decode([ListBrandModel].self, forKey: .ListBrand)
                print(value)
                self = .ListBrand(value)
            case .some(.collections):
                let value = try container.decode(collectionsModel.self, forKey: .collections)
                print(value)
                self = .collections(value)
            case .some(.linkVideo):
                let value = try container.decode(String.self, forKey: .linkVideo)
                print(value)
                self = .linkVideo(value)
            case .some(.listProduct):
                let value = try container.decode([listProductModel].self, forKey: .listProduct)
                print(value)
                self = .listProduct(value)
            case .some(.ListTrending):
                let value = try container.decode([String].self, forKey: .ListTrending)
                print(value)
                self = .ListTrending(value)
            case .OpenFashionSlogan:
                let value = try container.decode(String.self, forKey: .OpenFashionSlogan)
                print(value)
                self = .OpenFashionSlogan(value)
                
            case .FollowUs:
                let value = try container.decode([FollowUsModel].self, forKey: .FollowUs)
                print(value)
                self = .FollowUs(value)
            case .none:
                throw DecodingError.wrongJSON
            }
        }
    }
    
    func itemsCount() -> Int {
        return items.count
    }
    
//    func ReturnHeaderImageLinkModel() -> headerImageLinkModel{
//        return HomeModel.ItemsModel.headerImageLink([])
//    }
}


struct headerImageLinkModel:Decodable {
    let link:String
}

struct ArrivalModel:Decodable {
    enum CodingKeys: String, CodingKey {
        case Title = "Title"
        case collectionTitle = "collectionTitle"
        case listProduct = "listProduct"
    }
    let Title: String
    let collectionTitle: [collectionTitleModel]
    let listProduct: [listProductModel]
}

struct collectionTitleModel:Decodable {
    let title:String
    let isSelected:Bool
}

struct listProductModel:Decodable {
    let linkDownload:String
    let Description:String
    let Price:String
}
struct ListBrandModel:Decodable {
    let id:String
    let brandName:String
    
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
