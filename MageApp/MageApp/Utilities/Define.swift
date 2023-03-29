//
//  Define.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 29/03/2023.
//

import Foundation

struct ConstantsResponseResult {
    static let ResponseResult = "ResponseResult"
    static let ErrorCode = "ErrorCode"
    static let Message = "Message"
    static let Result:Any = Any?.self
}

struct Defaults {
    
    static let (nameKey , passWordKey) = ("name","password")
    static let userSessionKey = "com.save.usersession"
    private static let userDefault = UserDefaults.standard
    
    /**
       Nó được sử dụng để lấy ra và gán giá trị người dùng vào UserDefaults
     */
    struct UserDetails {
        let name: String
        let passWord:String
        
        init(_ json: [String: String]) {
            self.name = json[nameKey] ?? ""
            self.passWord = json[passWordKey] ?? ""
        }
    }
    
    /**
     - Lưu chi tiết người dùng
     - Inputs - name `String` & address `String`
     */
    static func save(_ name: String, passWord: String){
        userDefault.set([nameKey: name, passWordKey: passWord],
                        forKey: userSessionKey)
    }
    
    /**
     - Tìm nạp các giá trị thông qua Model `UserDetails`
     - Output - `UserDetails` model
     */
    static func getNameAndPassWord()-> UserDetails {
        return UserDetails((userDefault.value(forKey: userSessionKey) as? [String: String]) ?? [:])
    }
    
    /**
        - Xoá chi tiết người dùng trong UserDefault qua key "com.save.usersession"
     */
    static func clearUserData(){
        userDefault.removeObject(forKey: userSessionKey)
    }
}
