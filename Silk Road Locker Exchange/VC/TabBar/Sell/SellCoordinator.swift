//
//  SellCoordinator.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 11.10.2022.
//

import Foundation
import UIKit
import Combine

class SellCoordinator: BaseCoordenator {
    var errorDelegat: ErrorProtocol?
    
    var anyCancellables = Set<AnyCancellable>()
    
    var perentCoordinator:MainTabBarCoordinator?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
        self.navigationController.tabBarItem = UITabBarItem(title: "Sell", image: UIImage.init(named: "Sell"), tag: 0)
    }
    
    override func start() {
        let vc = SellViewController.instantiate()
        vc.coordinator = self
        errorDelegat = vc
        navigationController.pushViewController(vc, animated: true)
        perentCoordinator?.MainTabBarViews.append(navigationController)
    }
    
    func NewOffer() {
        let vc = CreateOfferViewController.instantiate()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func getByer() {
        //UserListViewController
        let vc = UserListViewController.instantiate()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}
