//
//  BaseResponse.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 07/12/2022.
//

import Foundation
import ObjectMapper

class BaseResponse {
    var errorCode: Int?
    var message: String?
    var result: Any
    init(errorCode: Int? = nil, message: String? = nil, result: Any) {
        self.errorCode = errorCode
        self.message = message
        self.result = result
    }
}


class BaseResponseError {
    var mErrorType: NetworkErrorType!
    var mErrorCode: Int!
    var mErrorMessage: String!
    
    init(_ errorType: NetworkErrorType,_ errorCode: Int,_ errorMessage: String) {
        mErrorType = errorType
        mErrorCode = errorCode
        mErrorMessage = errorMessage
    }
}
