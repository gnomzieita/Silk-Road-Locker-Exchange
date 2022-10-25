//
//  BaseResponseModel.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 25.10.2022.
//

import Foundation

struct BaseResponseModel: Codable {
    let success: Bool
    let data: [String:String]?
    let error: String?

}
