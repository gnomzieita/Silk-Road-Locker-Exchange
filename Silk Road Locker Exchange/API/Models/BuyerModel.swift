//
//  BuyerModel.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 11.11.2022.
//

import Foundation

struct ReceivedBuyerModel: Codable {
    let success: Bool
    let data: BuyersModel?
    let error: String?
    let message: String?

}

struct BuyersModel: Codable {
    let buyer: [BuyerModel]?

}

struct BuyerModel: Codable {
    let id: Int
    let first_name: String
    let last_name: String
    let email: String
    let phone: String
    let profile_picture_url: String
    
    func getProfileUrl() -> URL? {
        if let imageUrl = URL(string: profile_picture_url) {
            return imageUrl
        }
        return nil
    }
    
    func getName() -> String {
        return first_name + " " + last_name
    }

}
