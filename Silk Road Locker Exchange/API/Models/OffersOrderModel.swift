//
//  OffersOrderModel.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 17.11.2022.
//

import Foundation

struct OffersOrderModel: Codable {
    let message: String?
    let data: OffersModel?
    let auth_token: String?
    
    let error:String?
    
}

struct OffersModel: Codable {
    let offers: [OfferDetails]?
}


struct CreateOffersModel: Codable {
    let offer_id: Int
    let locker_id: Int
}

struct RejectOffersOrderModel: Codable {
    let message: String?
    let data: OffersModel?
    let auth_token: String?
    
    let error:String?
    
}

struct RejectOffersModel: Codable {
    let offers: OfferDetails?
}
