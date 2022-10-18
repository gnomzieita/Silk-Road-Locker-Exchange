//
//  SignUpCoordinator.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 04.10.2022.
//

import Foundation
import UIKit
import Combine

class RecoveryCoordinator: Coordinator {
    
    var anyCancellables = Set<AnyCancellable>()
    var errorDelegat: ErrorProtocol?
    
    var perentCoordinator:MainCoordinator? 
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SignUpViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func SignUP(model:SignUpModel) {
        // Downloading a single Decodable type
        API_Request.shared.SignUp(model: model).sink { error in
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
}
