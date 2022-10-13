//
//  PurchasedCoordinator.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 10.10.2022.
//

import Foundation
import UIKit
import Combine

class PurchasedCoordinator: BaseCoordenator {
    var errorDelegat: ErrorProtocol?
    
    var anyCancellables = Set<AnyCancellable>()
    
    var perentCoordinator:MainTabBarCoordinator?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
        self.navigationController.tabBarItem = UITabBarItem(title: "Purchased", image: UIImage.init(named: "Purchased"), tag: 0)
    }
    
    override func start() {
        let vc = PurchasedViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        perentCoordinator?.MainTabBarViews.append(navigationController)
    }
    
}
