//
//  ProductTableViewCell.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 09.06.2022.
//

import UIKit

//enum StatusType : Int {
//    case canceled, PendingPickup, PendingDelivery, Complete, PendingResponse
//}

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLibel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var fotoImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInfo(offerInfo: OfferDetails) {
        self.titleLabel.text = offerInfo.name
        self.descriptionLibel.text = ""
        self.priceLabel.text = offerInfo.price_usd
        self.dateLabel.text = ""
        self.setStatus(status: offerInfo.status)
    }
    
    func setStatus(status: OfferStatus) {
        switch status {
        case .canceled:
            self.descriptionLibel.text = "Canceled"
            self.descriptionLibel.textColor = #colorLiteral(red: 1, green: 0.3921568627, blue: 0.3921568627, alpha: 1)
        case .rejected:
            self.descriptionLibel.text = "Rejected"
            self.descriptionLibel.textColor = #colorLiteral(red: 1, green: 0.3921568627, blue: 0.3921568627, alpha: 1)
        case .complete:
            self.descriptionLibel.text = "Complete"
            self.descriptionLibel.textColor = #colorLiteral(red: 0.787740171, green: 0.787740171, blue: 0.787740171, alpha: 1)
        case .PendingPickup:
            self.descriptionLibel.text = "Pending pickup"
            self.descriptionLibel.textColor = #colorLiteral(red: 1, green: 0.8130037189, blue: 0, alpha: 1)
        case .PendingDelivery:
            self.descriptionLibel.text = "Pending delivery"
            self.descriptionLibel.textColor = #colorLiteral(red: 1, green: 0.8130037189, blue: 0, alpha: 1)
        case .PendingResponse:
            self.descriptionLibel.text = "Pending response"
            self.descriptionLibel.textColor = #colorLiteral(red: 1, green: 0.8130037189, blue: 0, alpha: 1)
        default:
            self.descriptionLibel.text = status.rawValue
            self.descriptionLibel.textColor = #colorLiteral(red: 1, green: 0.8130037189, blue: 0, alpha: 1)

        }
    }
}
