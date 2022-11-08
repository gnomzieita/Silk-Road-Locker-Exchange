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
    let message: String?

}

struct UpdatePasswordResponseModel: Codable {
    let success: Bool
    let message: String?
    let error: String?

}
