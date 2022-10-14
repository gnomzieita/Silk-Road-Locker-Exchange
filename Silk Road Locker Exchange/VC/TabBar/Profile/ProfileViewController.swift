//
//  ProfileViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 24.06.2022.
//

import UIKit

class ProfileViewController: RootViewController, UserInfoDelegat {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    
    func setUserInfo(_ model:UserModel) {
        userName.text = model.name
    }
    

    weak var coordinator: ProfileCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func exitTap(_ sender: Any) {
        
    }
    
    @IBAction func settingsTap(_ sender: Any) {
    }
    
    @IBAction func emailVerificationTap(_ sender: Any) {
    }
    
    @IBAction func phoneVerificationTap(_ sender: Any) {
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
