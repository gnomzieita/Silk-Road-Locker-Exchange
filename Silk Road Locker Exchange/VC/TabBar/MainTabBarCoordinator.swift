//
//  MainTabBarCoordinator.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 10.10.2022.
//

import Foundation
import UIKit
import Combine

class MainTabBarCoordinator: BaseCoordenator {
    
    var perentCoordinator:MainCoordinator?
    
    var MainTabBarViews = [UIViewController]()
    

    
    override func start() {
        let vc = RootTabBarController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        
        addPurchasedCoordinator()
        addSellCoordinator()
        //addChatCoordinator()
        addProfileCoordinator()
        addNotificationsCoordinator()
        
        vc.viewControllers = MainTabBarViews
    }
    
    private func addPurchasedCoordinator() {
        let child = PurchasedCoordinator(navigationController: UINavigationController())
        child.perentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    private func addSellCoordinator() {
        let child = SellCoordinator(navigationController: UINavigationController())
        child.perentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    private func addChatCoordinator() {
        let child = ChatCoordinator(navigationController: UINavigationController())
        child.perentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    private func addProfileCoordinator() {
        let child = ProfileCoordinator(navigationController: UINavigationController())
        child.perentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    private func addNotificationsCoordinator() {
        let child = NotificationsCoordinator(navigationController: UINavigationController())
        child.perentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func logOut() {
        perentCoordinator?.navigationController.popToRootViewController(animated: true)
    }
    
}

