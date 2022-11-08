//
//  RecoveryViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 07.07.2022.
//

import UIKit

class RecoveryViewController: RootViewController {

    weak var coordinator: SignInForgotCoordinator?
    
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coordinator?.errorDelegat = self
    }
    
    @IBAction func RequestCode(_ sender: Any) {
        coordinator?.RequestCode(email: emailField.getText())
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
