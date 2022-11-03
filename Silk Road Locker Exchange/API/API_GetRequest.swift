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
    var httpMethod: HTTPMethod = .GET
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

//TODO: /orders
struct CreateOrderBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/order")
    var httpMethod: HTTPMethod = .POST
    var queryItems: [String : String]?
    var headers: [String : String]?
    
    typealias ReturnType = SignUpModel
    
    var httpBody: [String: Any]?

    init(_ offer_id:String) {
        self.httpBody = ["offer_id":offer_id]
    }
}

//update_password
struct UpdatePasswordBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/user/update_password")
    var httpMethod: HTTPMethod = .PUT
    var queryItems: [String : String]?
    var headers: [String : String]?
    
    //FIXME: ReturnType
    typealias ReturnType = BaseResponseModel
    
    var httpBody: [String: Any]?

    init(_ newPass:ChangePasswordModel, token:String) {
        self.headers = token.Bearer()
        self.httpBody = newPass.dictionary
    }
}

// orders/purchased_orders
struct PurchasedOrdersBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/orders/purchased_orders")
    var httpMethod: HTTPMethod = .GET
    var queryItems: [String : String]?
    var headers: [String : String]?
    
    //FIXME: ReturnType
    typealias ReturnType = BaseResponseModel
    
    var httpBody: [String: Any]?

    init(token:String) {
        self.headers = token.Bearer()
    }
}
