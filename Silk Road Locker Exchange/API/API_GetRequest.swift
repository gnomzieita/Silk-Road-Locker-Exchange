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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
    typealias ReturnType = ReceivedOfersModel
    
    var httpBody: [String: Any]?

    init(token:String) {
        self.headers = token.Bearer()
    }
}

// /locations
struct LocationBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/locations")
    var httpMethod: HTTPMethod = .GET
    var queryItems: [String : String]?
    var headers: [String : String]?
    
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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
    typealias ReturnType = OfferResponseModel
    
    var httpBody: [String: Any]?

    init(offer_model:CreateOfferModel, token:String) {
        self.headers = token.Bearer()
        self.httpBody = ["location":[offer_model.dictionary as Any]]
    }
}

// /offers/sent_offers
struct SentOffersBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/offers/sent_offers")
    var httpMethod: HTTPMethod = .GET
    var queryItems: [String : String]?
    var headers: [String : String]?
    
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
    var queryItems: [String : String]?
    var headers: [String : String]?
    
    // FIXME: ReturnType
    typealias ReturnType = OffersOrderModel
    
    var httpBody: [String: Any]?

    init(token:String) {
        self.headers = token.Bearer()
    }
}
