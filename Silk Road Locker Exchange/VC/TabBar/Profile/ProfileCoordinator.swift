//
//  ProfileCoordinator.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 11.10.2022.
//

import Foundation
import UIKit
import Combine

protocol UserInfoDelegat {
    func setUserInfo(_ model:UserModel)
}

class ProfileCoordinator: BaseCoordenator {
    var errorDelegat: ErrorProtocol?
    let profileDelegat:UserInfoDelegat?
    
    var anyCancellables = Set<AnyCancellable>()
    
    var perentCoordinator:MainTabBarCoordinator?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
        self.navigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(named: "Profile"), tag: 0)
    }
    
    override func start() {
        let vc = ProfileViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        perentCoordinator?.MainTabBarViews.append(navigationController)
    }
    
}
