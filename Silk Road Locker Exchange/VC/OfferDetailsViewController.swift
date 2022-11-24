//
//  OfferDetailsViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 02.07.2022.
//

import UIKit

class OfferDetailsViewController: RootViewController {

    weak var coordinator: SellCoordinator?
    @IBOutlet weak var offerImage: AsyncImageView!
    
    @IBOutlet weak var offerFromName: UILabel!
    
    @IBOutlet weak var offerItemName: UILabel!
    
    @IBOutlet weak var offerPrice: UILabel!
    
    var offerInfo:OfferDetails?
    
    @IBOutlet weak var oferImage: DesignableImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackButton()

        if let info = offerInfo {
            //offerImage.setImage(url: info.)
            offerFromName.text = info.seller_details?.getName()
            offerPrice.text = info.price_usd
            offerItemName.text = ""
            
        }
    }

    @IBAction func cancelOffer(_ sender: Any) {
        coordinator?.RejectOfer()
    }
}
