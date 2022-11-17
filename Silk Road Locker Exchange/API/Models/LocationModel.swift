//
//  LocationModel.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 27.10.2022.
//

import Foundation

struct DigitalLockersModel:Codable {
    let name: String?
    let price_usd: String?
    let status: String?
}

struct AddressModel: Codable {
    let city: String?
    let state: String?
    let street: String?
    let zip_code: String?
    
    func getAddress() -> String {
        return (street ?? "") + ", " + (city ?? "") + ", " + (state ?? "") + ", " + (zip_code ?? "")
    }
}

struct LocationInfoModel: Codable {
    let address: AddressModel?
    let available_lockers: Int?
    let digital_lockers: [DigitalLockersModel]?

}

struct LocationModel: Codable {
    let location: [LocationInfoModel]?
}

struct BaseLocationResponseModel: Codable {
    let success: Bool
    let data: LocationModel?
    let error: String?
    let message: String?

}
