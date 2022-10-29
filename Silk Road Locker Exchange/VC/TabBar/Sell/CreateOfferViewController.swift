//
//  CreateOfferViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 06.07.2022.
//

import UIKit

class CreateOfferViewController: RootViewController {

    weak var coordinator: SellCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackButton()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userList" {
            let vc = segue.destination as! UserListViewController
            vc.isChatUsereList = false
        }
    }
    

}
