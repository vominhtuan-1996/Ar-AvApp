//
//  MegaHttps.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 07/12/2022.
//

import Foundation
import Alamofire
import ObjectMapper


@objc class MegaHttps: NSObject {
    var completionHandlers: ((Any,String,Any) -> ())?
    var errorCode:Int
    var message:String
    var result:Any
    enum services :String{
        case posts = "posts"
        case getDataHomePage = "home.json"
    }
    enum BaseUrl:String {
        case MobiMap = "https://raw.githubusercontent.com/vominhtuan-1996/APITest/main/Open_Fashion/"
    }
    let connectivityManager = NetworkReachabilityManager()
    var parameters = Parameters()
    var headers = HTTPHeaders()
    var method: HTTPMethod!
    var url :String! = BaseUrl.MobiMap.rawValue
    var encoding: ParameterEncoding! = URLEncoding.default
    init(data: [String:Any],headers: [String:String] = [:],url :String?,service :services? = nil, method: HTTPMethod = .post, isJSONRequest: Bool = true){
        self.errorCode = 1000
        self.message = ""
        self.result = []
        super.init()
        data.forEach{parameters.updateValue($0.value, forKey: $0.key)}
        headers.forEach({self.headers.add(name: $0.key, value: $0.value)})
        if url == nil, service != nil{
            self.url += service!.rawValue
        }else{
            self.url = url
        }
        if !isJSONRequest{
            encoding = URLEncoding.default
        }
        self.method = method
        print("Service: \(service?.rawValue ?? self.url + service!.rawValue ) \n data: \(parameters)")
        print(self.url as Any)
    }
    func executeQuery(completionHandlers:@escaping(Int,String,Any)-> Void , erroreHanders:@escaping(Error) -> Void) {
        AF.request(url,method: method,parameters: parameters,encoding: encoding, headers: headers).responseData(completionHandler: {response in
            switch response.result{
            case .success(let res):
                if let code = response.response?.statusCode{
                    switch code {
                    case 200...299:
                        do {
                            if let json = try JSONSerialization.jsonObject(with: res, options: []) as? [String: Any] {
                                // try to read out a string array
                                if (self .handerAPI(dict: json["responseResult"] as! NSDictionary)) {
                                    completionHandlers(self.errorCode, self.message,self.result)
                                }
                            }
                        } catch let error {
                            print(String(data: res, encoding: .utf8) ?? "nothing received")
                            erroreHanders(error)
                        }
                    default:
                        let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                        erroreHanders(error)
                    }
                }
            case .failure(let error):
                erroreHanders(error)
            }
        })
    }
    func handerAPI(dict:NSDictionary)-> Bool  {
        self.errorCode = dict["errorCode"] as? Int ?? 1000
        self.message = dict["message"] as? String ?? ""
        self.result = dict["result"] as Any
        if (self.errorCode == 0) {
            return true
        }
        return false
    }
}


