//
//  API_Request.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 07.10.2022.
//

import Foundation
import Combine

class API_Request: CombineNetworkService {
    
    static let shared = API_Request()
    var auth_token: String?

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
    
    //verification
//    func LogIn<T: Decodable>(email:String, passwd:String) -> AnyPublisher<T, NetworkServiceError> {
//        return self.getPublisherForResponse(request: GetSigInBaseRequest(email: email, passwd: passwd).request())
//    }
    
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
    
}
