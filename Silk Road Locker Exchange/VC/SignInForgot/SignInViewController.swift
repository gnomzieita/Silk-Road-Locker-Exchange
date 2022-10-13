//
//  SignInViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 07.07.2022.
//

import UIKit

class SignInViewController: RootViewController {

    weak var coordinator: SignInForgotCoordinator?
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackButton()
        // Do any additional setup after loading the view.
        //TODO: passwordField.passwordRules
    }
    
    @IBAction func SignInButtonTap(_ sender: Any) {
        coordinator?.SignIn(email: emailField.getText(), passwd: passwordField.getText())
    }
    
    @IBAction func ForgotButtonTap(_ sender: Any) {
        coordinator?.ForgotPassword()
    }
    
    @IBAction func ShowHidePass(_ sender: Any) {
        passwordField.isSecureTextEntry = !passwordField.isSecureTextEntry
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
