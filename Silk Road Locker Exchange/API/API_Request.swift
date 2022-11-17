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
    private var _auth_token: String = ""
    var auth_token: String {
        get{
            return self._auth_token
        }
        set {
            self._auth_token = newValue
            UserDefaults.standard.set(newValue, forKey: "auth_token")
        }
        
    }

    private override init() {
        if let token = UserDefaults.standard.object(forKey: "auth_token") as? String {
            _auth_token = token
        }
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
    func GetProfile<T: Decodable>() -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: GetProfileRequest(token: auth_token).request())
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
    
    func PurchasedOrders<T: Decodable>() -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: PurchasedOrdersBaseRequest(token: auth_token).request())
    }
    
    //ReceivedOffers
    func ReceivedOffers<T: Decodable>() -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: ReceivedOffersBaseRequest(token: auth_token).request())
    }
    
    //buyers
    func ReceivedBuyer<T: Decodable>() -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: ReceivedBuyerBaseRequest(token: auth_token).request())
    }
    
    //sold_orders
    func SoldOrders<T: Decodable>() -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: SoldOrdersBaseRequest(token: auth_token).request())
    }
    
    //LocationBaseRequest
    func Location<T: Decodable>(zip_code:String) -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: LocationBaseRequest(zip_code:zip_code,token: auth_token).request())
    }
    
    // CreateOffer
    func CreateOffer<T: Decodable>(offer_model: CreateOfferModel) -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: OffersBaseRequest(offer_model: offer_model, token: auth_token).request())
    }
        
    // CreateOffer
    func SentOffers<T: Decodable>() -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: SentOffersBaseRequest(token: auth_token).request())
    }
}
