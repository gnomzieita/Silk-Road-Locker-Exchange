//
//  SelectLocationTableViewCell.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 08.07.2022.
//

import UIKit

class SelectLocationTableViewCell: UITableViewCell {

    @IBOutlet weak var locerName: UILabel!
    @IBOutlet weak var adrressLabel: UILabel!
    
    @IBOutlet weak var availableLocerCount: UILabel!
    @IBOutlet weak var bgView: DesignableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadData(model: LocationInfoModel) {
        //locerName.text = model.
        adrressLabel.text = model.address?.getAddress()
        availableLocerCount.text = "Available lockers: \(model.available_lockers ?? 0)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
