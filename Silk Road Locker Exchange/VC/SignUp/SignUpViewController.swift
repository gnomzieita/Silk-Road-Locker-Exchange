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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackButton()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func showHidePass(_ sender: Any) {
    }
    
    @IBAction func privacyButton(_ sender: Any) {
    }
    
    @IBAction func signUp(_ sender: Any) {
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
