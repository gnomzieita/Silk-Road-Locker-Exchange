//
//  PurchasedOrderModel.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 03.11.2022.
//

import Foundation

struct PurchasedOrderModel: Codable {
    let message: String?
    let data: OrdersModel?
    let auth_token: String?
    
    let error:String?
    
}

struct OrdersModel: Codable {
    let orders: [OrderModel]?
}
struct OrderModel: Codable {
    let id: Int
    let placed_at: String? //"2022-08-19T13:37:55.574Z",
    let expected_delivery_date: String? //"2022-08-22T13:37:55.574Z",
    let delivered_at: String? //null,
    let status: String? //"pending",
    let offer_details: OfferDetails?
    
}

enum OfferStatus: String, Codable {
    case rejected
    case sent
    case accepted
    
    case canceled
    case complete
    case PendingPickup
    case PendingDelivery
    case PendingResponse
}

struct OfferDetails: Codable {
    let id: Int
    let name: String? //"one offer - 2k22",
//    let price: []
    let status: OfferStatus //"accepted",
    let buyer_id: Int //3,
    let seller_id: Int //2,
    let weight: Float //3.4,
    let weighing_unit: String? //"kg",
    //let size: []
    let price_usd: String? //"$3.20",
    let buyer_details: BuyerDetails?
    let seller_details: SellerDetails?
    
}

struct BuyerDetails: Codable {
    let id: Int
    let first_name: String? //null,
    let last_name: String? //null,
    let email: String? //"admin1@gmail.com",
    let phone: String? //"0410002223",
    let name: String? //" "
}

struct SellerDetails: Codable {
    let id: Int
    let first_name: String? //null,
    let last_name: String? //null,
    let email: String? //"admin1@gmail.com",
    let phone: String? //"0410002223",
    let name: String? //" "
    
    func getName() -> String {
        return (first_name ?? "") + " " + (last_name ?? "")
    }
}
/*
 {

  
         "price": {
             "cents": 320,
             "currency_iso": "USD"
         },

         "size": {
             "width": "10.0",
             "height": "8.0",
             "size_unit": "m"
         },

 },
 */
