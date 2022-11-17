//
//  PurchaseViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 07.07.2022.
//

import UIKit

class PurchaseViewController: RootViewController {

    weak var coordinator: PurchasedCoordinator?
     var offerInfo:OfferDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hidesBottomBarWhenPushed = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.hidesBottomBarWhenPushed = false
    }

    deinit {
        coordinator?.selectOfferID = nil
    }
    
    @IBAction func PurchaseButtonTap(_ sender: Any) {
        
    }
    
    @IBAction func RejectButtonTap(_ sender: Any) {
        
    }
    
}
