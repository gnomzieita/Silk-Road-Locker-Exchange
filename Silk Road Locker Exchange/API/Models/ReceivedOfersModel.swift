//
//  ReceivedOfersModel.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 08.11.2022.
//

import Foundation

struct ReceivedOfersModel: Codable {
    let success: Bool
    let data: OfersModel?
    let error: String?
    let message: String?

}

struct OfersModel: Codable {
    let orders: [OfferDetails]?
}


