//
//  SignUpViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 07.07.2022.
//

import UIKit

class SignUpViewController: RootViewController {

    weak var coordinator: RecoveryCoordinator?
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackButton()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coordinator?.errorDelegat = self
    }
    
    @IBAction func showHidePass(_ sender: Any) {
        passwordField.isSecureTextEntry = !passwordField.isSecureTextEntry
    }
    
    @IBAction func privacyButton(_ sender: Any) {
    }
    
    @IBAction func signUp(_ sender: Any) {
        let model = SignUpModel(first_name: firstName.getText(), last_name: lastName.getText(), email: emailField.getText(), phone: phoneField.getText(), password: passwordField.getText(), password_confirmation: passwordField.getText())
        coordinator?.SignUP(model: model)
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
