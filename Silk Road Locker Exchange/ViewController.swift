//
//  ViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 06.06.2022.
//

import UIKit

class ViewController: RootViewController {

    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SignUp(_ sender: Any) {
        coordinator?.SignUp()
    }
    
    @IBAction func SignInButtonTap(_ sender: Any) {
        coordinator?.SignIn()
    }
    
}

