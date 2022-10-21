//
//  EmailVerificationViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 21.10.2022.
//

import UIKit

class EmailVerificationViewController: RootViewController {

    weak var coordinator: RecoveryCoordinator?
    @IBOutlet weak var codeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirmTap(_ sender: Any) {
        coordinator?.enterConfirmCodeView(token: codeField.getText())
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
