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
        case Login = "stag/FMapService.svc/Login"
    }
    enum BaseUrl:String {
        case MobiMap = "https://raw.githubusercontent.com/vominhtuan-1996/APITest/main/Open_Fashion/"
        case MobiMapHost = "https://mobimapstag.fpt.vn/"
    }
    let connectivityManager = NetworkReachabilityManager()
    var parameters = Parameters()
    var headers = HTTPHeaders()
    var method: HTTPMethod!
    var url :String! = BaseUrl.MobiMap.rawValue
    var encoding: ParameterEncoding! = URLEncoding.default
    init(data: [String:Any],headers: [String:String] = [:],url :BaseUrl,service :services? = nil, method: HTTPMethod = .post, isJSONRequest: Bool = true){
        self.errorCode = 1000
        self.message = ""
        self.result = []
        super.init()
        data.forEach{parameters.updateValue($0.value, forKey: $0.key)}
        headers.forEach({self.headers.add(name: $0.key, value: $0.value)})
        self.url = url.rawValue
        self.url += service!.rawValue
        if isJSONRequest{
            encoding = JSONEncoding.default
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
                                json.keys.forEach { Response in
                                    if (Response == "ResponseResult") {
                                        if (self .handerAPIV1(dict: json["ResponseResult"] as! NSDictionary)) {
                                            completionHandlers(self.errorCode, self.message,self.result)
                                        } else {
                                            completionHandlers(self.errorCode, self.message,self.result)
                                        }
                                    } else {
                                        if (self .handerAPIV2(dict: json["responseResult"] as! NSDictionary)) {
                                            completionHandlers(self.errorCode, self.message,self.result)
                                        } else {
                                            completionHandlers(self.errorCode, self.message,self.result)
                                        }
                                    }
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
    
    func handerAPIV2(dict:NSDictionary)-> Bool  {
        self.errorCode = dict["errorCode"] as? Int ?? 1000
        self.message = dict["message"] as? String ?? ""
        self.result = dict["result"] as Any
        if (self.errorCode == 0) {
            return true
        }
        return false
    }
    func handerAPIV1(dict:NSDictionary)-> Bool  {
        self.errorCode = dict["ErrorCode"] as? Int ?? 1000
        self.message = dict["Message"] as? String ?? ""
        self.result = dict["Result"] as Any
        if (self.errorCode == 0) {
            return true
        }
        return false
    }
}


