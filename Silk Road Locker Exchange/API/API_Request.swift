//
//  API_Request.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 07.10.2022.
//

import Foundation
import Combine
import UIKit

class API_Request: CombineNetworkService {
    
    static let shared = API_Request()
    var auth_token: String = ""

    private override init() {
        
        //TODO: Save auth_token to UserDefault
    }
    
    func LogIn<T: Decodable>(email:String, passwd:String) -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: GetSigInBaseRequest(email: email, passwd: passwd).request())
    }
    
    //Sign up
    func SignUp<T: Decodable>(model:SignUpModel) -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: GetSigUpBaseRequest(model).request())
    }
    
    //recovery
    func ForgetPassword<T: Decodable>(email:String) -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: forgetPasswordRequest(email: email).request())
    }
    
    func ResetPassword<T: Decodable>(code:String, password:String, confirm_password:String) -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: ResetPasswordRequest(code: code, password: password, confirm_password: confirm_password).request())
    }
    
    //Profile
    func GetProfile<T: Decodable>(email:String, passwd:String) -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: GetSigInBaseRequest(email: email, passwd: passwd).request())
    }
    
    //editing
    func EditProfile<T: Decodable>(email:String, passwd:String) -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: GetSigInBaseRequest(email: email, passwd: passwd).request())
    }
    
    //order creation
    func CreateOrder<T: Decodable>(email:String, passwd:String) -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: GetSigInBaseRequest(email: email, passwd: passwd).request())
    }
    
    //RequestCode
    func RequestCode<T: Decodable>(email:String, passwd:String) -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: GetSigInBaseRequest(email: email, passwd: passwd).request())
    }
    
    //email_confirm
    func EmailConfirm<T: Decodable>(token:String) -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: EmailConfirmBaseRequest(token).request())
    }
    
    //update_password
    func UpdatePassword<T: Decodable>(model:ChangePasswordModel) -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: UpdatePasswordBaseRequest(model, token:auth_token).request())
    }
    
    //update_profile
    func UpdateUserProfile<T: Decodable>(model:UpdateProfileModel) -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: updateProfileRequest(model, token:auth_token).request())
    }
    
    func getImage(imageUrl:URL) -> AnyPublisher<UIImage, NetworkServiceError> {
        return self.getImageForResponse(url: imageUrl)
    }
}
