//
//  SignInForgotCoordinator.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 05.10.2022.
//

import Foundation
import UIKit
import Combine

class SignInForgotCoordinator: Coordinator {
    var errorDelegat: ErrorProtocol?
    
    private let baseURLString = "https://jsonplaceholder.typicode.com/"
    var anyCancellables = Set<AnyCancellable>()
    
    var perentCoordinator:MainCoordinator?
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SignInViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func ForgotPassword() {
        let vc = RecoveryViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func SignIn(email:String, passwd:String) {
        // Downloading a single Decodable type
        
        API_Request.shared.LogIn(email: email, passwd: passwd).sink { error in
                // no-op
            print(error)
        
        } receiveValue: { (signIN: SigInModel) in
            
            if let error = signIN.error {
                self.errorDelegat?.error(error)
            }
            else
            {
                API_Request.shared.auth_token = signIN.auth_token
                DispatchQueue.main.async {
                    self.perentCoordinator?.LogIn()
                }
            }
        }.store(in: &anyCancellables)
    }
    
    func RequestCode(email:String) {
//        API_Request.shared.LogIn(email: email).sink { _ in
//                // no-op
//        } receiveValue: { (signIN: SigInModel) in
//
//            if let error = signIN.error as! String {
//                self.errorDelegat?.error(error)
//            }
//            else
//            {
//                API_Request.shared.auth_token = signIN.auth_token
//                DispatchQueue.main.async {
//                    self.perentCoordinator?.LogIn()
//                }
//            }
//        }.store(in: &anyCancellables)
        
        let vc = VerifyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    //SetupNewPasswordViewController
    func SendCode(code:String) {
//        API_Request.shared.LogIn(email: email).sink { _ in
//                // no-op
//        } receiveValue: { (signIN: SigInModel) in
//
//            if let error = signIN.error as! String {
//                self.errorDelegat?.error(error)
//            }
//            else
//            {
//                API_Request.shared.auth_token = signIN.auth_token
//                DispatchQueue.main.async {
//                    self.perentCoordinator?.LogIn()
//                }
//            }
//        }.store(in: &anyCancellables)
        
        let vc = SetupNewPasswordViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func setupNewPassword(newPass:String, reNewPass:String){
//        API_Request.shared.LogIn(email: email).sink { _ in
//                // no-op
//        } receiveValue: { (signIN: SigInModel) in
//
//            if let error = signIN.error as! String {
//                self.errorDelegat?.error(error)
//            }
//            else
//            {
//                API_Request.shared.auth_token = signIN.auth_token
//                DispatchQueue.main.async {
//                    self.perentCoordinator?.LogIn()
//                }
//            }
//        }.store(in: &anyCancellables)
        
        self.perentCoordinator?.navigationController.popToRootViewController(animated: true)
    }
    
    func LogIn() {
        let vc = RecoveryViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
}
