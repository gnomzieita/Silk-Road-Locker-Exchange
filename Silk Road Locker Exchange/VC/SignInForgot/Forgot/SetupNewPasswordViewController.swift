//
//  SetupNewPasswordViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 07.07.2022.
//

import UIKit

class SetupNewPasswordViewController: RootViewController {

    weak var coordinator: SignInForgotCoordinator?
    var coode: String = ""
    
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var confirmNewPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coordinator?.errorDelegat = self
    }
    
    @IBAction func showNP(_ sender: Any) {
        newPassword.isSecureTextEntry = !newPassword.isSecureTextEntry
    }
    
    @IBAction func showCNP(_ sender: Any) {
        confirmNewPassword.isSecureTextEntry = !confirmNewPassword.isSecureTextEntry
    }
    
    @IBAction func apply(_ sender: Any) {
        coordinator?.setupNewPassword(code: coode, password: newPassword.getText(), confirm_password: confirmNewPassword.getText())
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
