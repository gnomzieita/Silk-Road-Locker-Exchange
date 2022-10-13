//
//  PaymentTableViewCell.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 07.07.2022.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {

    @IBOutlet weak var chekImage: UIImageView!
    
    @IBOutlet weak var cardNumber: UILabel!
    
    var isChek:Bool = false {
        didSet {
            self.chekImage.image = isChek ? UIImage(named: "chek") : UIImage(named: "un_chek")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func deleteButton(_ sender: Any) {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
