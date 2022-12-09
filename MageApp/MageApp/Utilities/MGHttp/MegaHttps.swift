//
//  MegaHttps.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 07/12/2022.
//

import Foundation
import Alamofire
import ObjectMapper

class MegaHttps: NSObject {
    
    enum services :String{
            case posts = "posts"
            case getDataHomePage = "getDataHomePage"
        }
    enum BaseUrl:String {
        case MobiMap = "https://633fe29fd1fcddf69cabb925.mockapi.io/"
    }
    let connectivityManager = NetworkReachabilityManager()
    var parameters = Parameters()
    var headers = HTTPHeaders()
    var method: HTTPMethod!
    var url :String! = BaseUrl.MobiMap.rawValue
    var encoding: ParameterEncoding! = URLEncoding.default
    init(data: [String:Any],headers: [String:String] = [:],url :String?,service :services? = nil, method: HTTPMethod = .post, isJSONRequest: Bool = true){
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
    func executeQuery<T>(completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
            AF.request(url,method: method,parameters: parameters,encoding: encoding, headers: headers).responseData(completionHandler: {response in
                switch response.result{
                case .success(let res):
                    if let code = response.response?.statusCode{
                        switch code {
                        case 200...299:
                            do {
                                completion(.success(try JSONDecoder().decode(T.self, from: res)))
                            } catch let error {
                                print(String(data: res, encoding: .utf8) ?? "nothing received")
                                completion(.failure(error))
                            }
                        default:
                            let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                            completion(.failure(error))
                        }
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            })
        }
    }
