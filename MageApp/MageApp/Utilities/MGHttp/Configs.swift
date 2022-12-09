//
//  Configs.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 07/12/2022.
//

import UIKit
import Foundation

struct Production {
    static let BASE_URL: String = "https://your_base_url.com/api/" // Thay thế bằng Base url mà bạn sử dụng ở đây
}

enum NetworkErrorType {
    case API_ERROR
    case HTTP_ERROR
}
