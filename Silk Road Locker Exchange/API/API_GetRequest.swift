//
//  API_GetRequest.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 13.10.2022.
//

import Foundation


struct GetSigInBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/users/login")
    var httpMethod: HTTPMethod = .POST
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = SigInModel
    
    var httpBody: [String: Any]?

    init(email:String, passwd:String) {
        self.httpBody = ["user":["email": email,
                         "password":passwd]]
    }
}

struct ResetPasswordRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/users/reset_password")
    var httpMethod: HTTPMethod = .POST
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = SigInModel
    
    var httpBody: [String: Any]?

    init(code:String, password:String, confirm_password:String) {
        self.httpBody = ["user":["code":code,
                                 "password": password,
                                 "confirm_password": confirm_password]]
    }
}

//users/forget_password
struct forgetPasswordRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/users/forget_password")
    var httpMethod: HTTPMethod = .POST
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = SigInModel
    
    var httpBody: [String: Any]?

    init(email:String) {
        self.httpBody = ["user": ["email":email]]
    }
}
        
// /users/profile
struct GetProfileRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/users/profile")
    var httpMethod: HTTPMethod = .GET
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = UserProfileModel
    
    var httpBody: [String: Any]?
    
    init(token:String) {
        self.headers = token.Bearer()
    }
}

// /users/update_profile
struct updateProfileRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/users/update_profile")
    var httpMethod: HTTPMethod = .PUT
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = SigInModel
    
    var httpBody: [String: Any]?
    
    init(_ model:UpdateProfileModel, token:String) {
        self.headers = token.Bearer()
        self.httpBody = ["user":model.dictionary as Any]
    }
}

struct ChangePasswordRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/users/change_password")
    var httpMethod: HTTPMethod = .PUT
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = SigInModel
    
    var httpBody: [String: Any]?
    
    init(_ model:ChangePasswordModel, token:String) {
        self.headers = token.Bearer()
        self.httpBody = ["user":model.dictionary as Any]
    }
}

struct GetSigUpBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/users/signup")
    var httpMethod: HTTPMethod = .POST
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = SignUpUserModel
    
    var httpBody: [String: Any]?

    init(_ model:SignUpModel) {
        self.httpBody = ["user":model.dictionary as Any]
    }
}

// /users/email_confirm
struct EmailConfirmBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/users/email_confirm")
    var httpMethod: HTTPMethod = .POST
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = SignUpModel
    
    var httpBody: [String: Any]?

    init(_ token:String) {
        self.httpBody = ["user":["token":token]]
    }
}

//update_password
struct UpdatePasswordBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/users/update_password")
    var httpMethod: HTTPMethod = .PATCH
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = UpdatePasswordResponseModel
    
    var httpBody: [String: Any]?

    init(_ newPass:ChangePasswordModel, token:String) {
        self.headers = token.Bearer()
        self.httpBody = ["user":newPass.dictionary as Any]
    }
}

// orders/purchased_orders
struct PurchasedOrdersBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/orders/purchased_orders")
    var httpMethod: HTTPMethod = .GET
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = BaseResponseModel
    
    var httpBody: [String: Any]?

    init(token:String) {
        self.headers = token.Bearer()
    }
}

// /offers/received_offers
struct ReceivedOffersBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/offers/received_offers")
    var httpMethod: HTTPMethod = .GET
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = OffersOrderModel
    
    var httpBody: [String: Any]?

    init(token:String) {
        self.headers = token.Bearer()
    }
}

// /users/buyers
struct ReceivedBuyerBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/users/buyers")
    var httpMethod: HTTPMethod = .GET
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = ReceivedBuyerModel
    
    var httpBody: [String: Any]?

    init(token:String) {
        self.headers = token.Bearer()
    }
}

// /orders/sold_orders
struct SoldOrdersBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/orders/sold_orders")
    var httpMethod: HTTPMethod = .GET
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = ReceivedOfersModel
    
    var httpBody: [String: Any]?

    init(token:String) {
        self.headers = token.Bearer()
    }
}

// /locations
struct LocationBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/locations")
    var httpMethod: HTTPMethod = .POST
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = BaseLocationResponseModel
    
    var httpBody: [String: Any]?

    init(zip_code:String,token:String) {
        self.headers = token.Bearer()
        self.httpBody = ["location":["zip_code":zip_code]]
    }
}

struct OffersBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/offers")
    var httpMethod: HTTPMethod = .POST
    var contentType: ContentType = .multipart_form_data
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = OfferResponseModel
    
    var httpBody: [String: Any]?

    init(offer_model:CreateOfferModel, token:String) {
        self.headers = token.Bearer()
        
        self.httpBody = offer_model.getHttpBody()
    }
}

// /offers/sent_offers
struct SentOffersBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/offers/sent_offers")
    var httpMethod: HTTPMethod = .GET
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    typealias ReturnType = OffersOrderModel
    
    var httpBody: [String: Any]?

    init(token:String) {
        self.headers = token.Bearer()
    }
}

// /orders
struct CreateOrderBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/orders")
    var httpMethod: HTTPMethod = .POST
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    // FIXME: ReturnType
    typealias ReturnType = OffersOrderModel
    
    var httpBody: [String: Any]?

    init(offer_id: Int, locker_id: Int,token:String) {
        self.headers = token.Bearer()
        self.httpBody = ["order":["offer_id":offer_id,"locker_id":locker_id]]
    }
}

///offers/1/reject_buy_offer
///

struct RejectBuyOfferBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/offers")
    var httpMethod: HTTPMethod = .PATCH
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    // FIXME: ReturnType
    typealias ReturnType = OffersOrderModel
    
    var httpBody: [String: Any]?

    init(offer_id: Int,token:String) {
        self.headers = token.Bearer()
        self.path = "/\(offer_id)/reject_buy_offer"
    }
}

struct CancelSellOfferBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/offers")
    var httpMethod: HTTPMethod = .PATCH
    var contentType: ContentType = .application_json
    var queryItems: [String : String]?
    var headers: [String : String]?
    var path: String?
    
    // FIXME: ReturnType
    typealias ReturnType = OffersOrderModel
    
    var httpBody: [String: Any]?

    init(offer_id: Int,token:String) {
        self.headers = token.Bearer()
        self.path = "/\(offer_id)/cancel_sell_offer"
    }
}
