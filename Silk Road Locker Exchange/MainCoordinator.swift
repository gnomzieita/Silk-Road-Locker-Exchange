//
//  MainCoordinator.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 04.10.2022.
//

import Foundation
import UIKit

class MainCoordinator:BaseCoordenator {
    
    override func start() {
        navigationController.delegate = self
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func SignUp() {
        let child = RecoveryCoordinator(navigationController: navigationController)
        child.perentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func SignIn() {
        let child = SignInForgotCoordinator(navigationController: navigationController)
        child.perentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func LogIn() {
        let child = MainTabBarCoordinator(navigationController: navigationController)
        child.perentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}
