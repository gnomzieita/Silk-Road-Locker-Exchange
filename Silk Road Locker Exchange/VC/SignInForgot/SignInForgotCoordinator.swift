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
    var errorDelegat: LoadProtocol?
    
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
        self.errorDelegat = vc
        navigationController.pushViewController(vc, animated: true)
    }
    
    func ForgotPassword() {
        let vc = RecoveryViewController.instantiate()
        vc.coordinator = self
        self.errorDelegat = vc
        navigationController.pushViewController(vc, animated: false)
    }
    
    func SignIn(email:String, passwd:String) {
        // Downloading a single Decodable type
        self.errorDelegat?.startActyvity()
        API_Request.shared.LogIn(email: email, passwd: passwd).sink { error in
                // no-op
            print("Error=====================\(error)")
        
        } receiveValue: { (signIN: SigInModel) in
            self.errorDelegat?.stopActyvity()
            if let error = signIN.error {
                self.errorDelegat?.error(error)
            }
            else
            {
                self.errorDelegat?.stopActyvity()
                API_Request.shared.auth_token = signIN.data?.auth_token ?? ""
                DispatchQueue.main.async {
                    self.perentCoordinator?.LogIn()
                }
            }
        }.store(in: &anyCancellables)
    }
    
    func RequestCode(email:String) {
        self.errorDelegat?.startActyvity()
        API_Request.shared.ForgetPassword(email: email).sink { _ in
                // no-op
        } receiveValue: { (signIN: SigInModel) in
            self.errorDelegat?.stopActyvity()
            if let error = signIN.error {
                self.errorDelegat?.error(error)
            }
            else
            {
//                API_Request.shared.auth_token = signIN.auth_token
                DispatchQueue.main.async {
                    let vc = VerifyViewController.instantiate()
                    vc.coordinator = self
                    self.errorDelegat = vc
                    self.navigationController.pushViewController(vc, animated: false)
                }
            }
        }.store(in: &anyCancellables)
    }
    
    //SetupNewPasswordViewController
    func SendCode(code:String) {
        let vc = SetupNewPasswordViewController.instantiate()
        vc.coordinator = self
        vc.coode = code
        self.errorDelegat = vc
        navigationController.pushViewController(vc, animated: false)
    }
    
    func setupNewPassword(code:String, password:String, confirm_password:String){
        self.errorDelegat?.startActyvity()
        API_Request.shared.ResetPassword(code: code, password: password, confirm_password: confirm_password).sink { _ in
                // no-op
        } receiveValue: { (signIN: SigInModel) in
            self.errorDelegat?.stopActyvity()
            if let error = signIN.error {
                self.errorDelegat?.error(error)
            }
            else
            {
                DispatchQueue.main.async {
                    self.perentCoordinator?.navigationController.popToRootViewController(animated: true)
                }
            }
        }.store(in: &anyCancellables)
    }
    
    func LogIn() {
        let vc = RecoveryViewController.instantiate()
        vc.coordinator = self
        self.errorDelegat = vc
        navigationController.pushViewController(vc, animated: false)
    }
    
}
