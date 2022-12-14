//
//  CreateOfferModel.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 16.11.2022.
//

import Foundation

struct CreateOfferModel: Codable {
    let image: Data
    let name: String
    let price: Float
    let buyer_id: Int
    
    func getHttpBody() -> [String:Any] {
        return ["image":image,
                "name":name,
                "price":price,
                "buyer_id":buyer_id]
    }
}

struct OfferResponseModel: Codable {
    let success: Bool
    let data: OfferDataModel?
    let error: String?
    let message: String?

}

struct OfferDataModel: Codable {
    let offer: OfferDetails

}
