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

//TODO: reset_password
struct RequestCodeRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/users/reset_password")
    var httpMethod: HTTPMethod = .POST
    var queryItems: [String : String]?
    var headers: [String : String]?
    
    typealias ReturnType = SigInModel
    
    var httpBody: [String: Any]?

    init(email:String, passwd:String) {
        self.httpBody = ["email": email,
                         "password":passwd]
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
    
    typealias ReturnType = UserModel
    
    var httpBody: [String: Any]?
    
    init(token:String) {
        self.headers = ["Authorization":"Bearer \(token)"]
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
    
    init(_ model:SignUpModel, token:String) {
        self.headers = ["Authorization":"Bearer \(token)"]
        self.httpBody = ["user":model.dictionary as Any]
    }
}

struct GetSigUpBaseRequest: BaseRequest {
    var url: URL = API.server.getURLwithPath(path: "/users/signup")
    var httpMethod: HTTPMethod = .POST
    var queryItems: [String : String]?
    var headers: [String : String]?
    
    typealias ReturnType = SignUpModel
    
    var httpBody: [String: Any]?

    init(_ model:SignUpModel) {
        self.httpBody = ["user":model.dictionary as Any]
    }
    
    
}
