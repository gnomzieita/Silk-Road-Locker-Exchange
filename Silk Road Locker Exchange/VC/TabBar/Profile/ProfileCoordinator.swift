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
    var profileDelegat:UserInfoDelegat?
    
    var anyCancellables = Set<AnyCancellable>()
    
    var perentCoordinator:MainTabBarCoordinator?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
        self.navigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(named: "Profile"), tag: 0)
    }
    
    override func start() {
        let vc = ProfileViewController.instantiate()
        vc.coordinator = self
        self.profileDelegat = vc
        navigationController.pushViewController(vc, animated: true)
        perentCoordinator?.MainTabBarViews.append(navigationController)
    }
    
    func profileSettings() {
        let vc = EditProfileViewController.instantiate()
        vc.coordinator = self
        self.profileDelegat = vc
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}

extension ProfileCoordinator {
    
    func UpdateUserProfile(userInfo model:UpdateProfileModel) {
        API_Request.shared.UpdateUserProfile(model: model).sink { error in
                // no-op
            print(error)
        
        } receiveValue: { (signIN: SigInModel) in
            
            if let error = signIN.error {
                self.errorDelegat?.error(error)
            }
            else
            {
                //FIXME: Update profile message
            }
        }.store(in: &anyCancellables)

    }
    
    func setNewPassword(passwordModel: ChangePasswordModel){
        API_Request.shared.UpdatePassword(model: passwordModel).sink { error in
                // no-op
            print(error)
        
        } receiveValue: { (signIN: SigInModel) in
            
            if let error = signIN.error {
                self.errorDelegat?.error(error)
            }
            else
            {
                //FIXME: Update Password message
            }
        }.store(in: &anyCancellables)
    }
}

