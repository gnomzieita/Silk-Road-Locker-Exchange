//
//  EditProfileViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 07.07.2022.
//

import UIKit

class EditProfileViewController: RootViewController, UserInfoDelegat {
    
    @IBOutlet weak var firstNAmeField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var emailText: UILabel!
    
    @IBOutlet weak var curentPassword: UITextField!
    
    @IBOutlet weak var newPassword: UITextField!
    
    @IBOutlet weak var confirmNewPassword: UITextField!
    
    func setUserInfo(_ model: UserModel) {
        //FIXME: - ffff
        
        firstNAmeField.text = model.first_name
        lastNameField.text = model.last_name
        emailText.text = model.email
        phoneField.text = model.phone
    }
    

    weak var coordinator: ProfileCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackButton()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changePasswordTap(_ sender: Any) {
        let passwordInfo = ChangePasswordModel(password: newPassword.getText(), password_confirmation: confirmNewPassword.getText(), current_password: curentPassword.getText())
        coordinator?.setNewPassword(passwordModel: passwordInfo)
    }
    
    @IBAction func saveChange(_ sender: Any) {
        let userInfo = UpdateProfileModel(first_name: firstNAmeField.getText(), last_name: lastNameField.getText(),phone: phoneField.getText())
        coordinator?.UpdateUserProfile(userInfo: userInfo)
    }
    
    @IBAction func emailNotification(_ sender: Any) {
        
    }
    
    @IBAction func pushNotifications(_ sender: Any) {
        
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
