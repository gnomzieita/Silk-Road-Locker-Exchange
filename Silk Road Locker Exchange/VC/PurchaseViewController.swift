//
//  PurchaseViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 07.07.2022.
//

import UIKit

class PurchaseViewController: RootViewController {

    weak var coordinator: PurchasedCoordinator?
    @IBOutlet weak var offerImage: AsyncImageView!
    
    @IBOutlet weak var offerFromName: UILabel!
    
    @IBOutlet weak var offerItemName: UILabel!
    
    @IBOutlet weak var offerPrice: UILabel!
    
    var offerInfo:OfferDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hidesBottomBarWhenPushed = true
        
        if let info = offerInfo {
            //offerImage.setImage(url: info.)
            offerFromName.text = info.seller_details?.getName()
            offerPrice.text = info.price_usd
            offerItemName.text = ""
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.hidesBottomBarWhenPushed = false
    }

    deinit {
        coordinator?.selectOfferID = nil
    }
    
    @IBAction func PurchaseButtonTap(_ sender: Any) {
        coordinator?.SelectLocation()
    }
    
    @IBAction func RejectButtonTap(_ sender: Any) {
        coordinator?.RejectOfer()
    }
    
}
