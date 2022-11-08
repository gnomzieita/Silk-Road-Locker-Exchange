//
//  NotificationsCoordinator.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 11.10.2022.
//

import Foundation
import UIKit
import Combine

class NotificationsCoordinator: BaseCoordenator {
    
    var anyCancellables = Set<AnyCancellable>()
    
    var perentCoordinator:MainTabBarCoordinator?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
        self.navigationController.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage.init(named: "Notifications"), tag: 0)
    }
    
    override func start() {
        let vc = NotificationsViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        perentCoordinator?.MainTabBarViews.append(navigationController)
    }
    
}

