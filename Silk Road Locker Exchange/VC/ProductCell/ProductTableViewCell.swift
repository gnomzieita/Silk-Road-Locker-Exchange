//
//  ProductTableViewCell.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 09.06.2022.
//

import UIKit

//enum StatusType : Int {
//    case Canceled, PendingPickup, PendingDelivery, Complete, PendingResponse
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
    
    func setDate(date: NSInteger) {
        self.dateLabel.text = "Date"
    }
    
    func setStatus(status: String) {
        switch status {
        case "Canceled":
            self.dateLabel.text = "Canceled"
            self.dateLabel.textColor = #colorLiteral(red: 1, green: 0.3921568627, blue: 0.3921568627, alpha: 1)
        case "Complete":
            self.dateLabel.text = "Complete"
            self.dateLabel.textColor = #colorLiteral(red: 0.787740171, green: 0.787740171, blue: 0.787740171, alpha: 1)
        case "PendingPickup":
            self.dateLabel.text = "Pending pickup"
            self.dateLabel.textColor = #colorLiteral(red: 1, green: 0.8130037189, blue: 0, alpha: 1)
        case "PendingDelivery":
            self.dateLabel.text = "Pending delivery"
            self.dateLabel.textColor = #colorLiteral(red: 1, green: 0.8130037189, blue: 0, alpha: 1)
        case "PendingResponse":
            self.dateLabel.text = "Pending response"
            self.dateLabel.textColor = #colorLiteral(red: 1, green: 0.8130037189, blue: 0, alpha: 1)
        default:
            self.dateLabel.text = status
            self.dateLabel.textColor = #colorLiteral(red: 1, green: 0.8130037189, blue: 0, alpha: 1)

        }
    }
}
