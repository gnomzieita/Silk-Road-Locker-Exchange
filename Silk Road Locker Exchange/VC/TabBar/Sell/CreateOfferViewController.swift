//
//  CreateOfferViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 06.07.2022.
//

import UIKit

class CreateOfferViewController: RootViewController {

    weak var coordinator: SellCoordinator?
    var imagePicker: ImagePicker!
    @IBOutlet weak var priceField: UITextField!
    var selectBuyerID:Int?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var selectBuyerField: UITextField!
    @IBOutlet weak var imageView: DesignableImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackButton()
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coordinator?.errorDelegat = self
        if let buyer = coordinator?.selectedBuyer {
            selectBuyerField.text = buyer.getName()
            selectBuyerID = buyer.id
        }
    }
    
    @IBAction func selectImage(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    
    @IBAction func selectBuyer(_ sender: Any) {
        self.coordinator?.getByer()
    }
    
    @IBAction func SendTap(_ sender: Any) {
        if let imageData = self.imageView.image?.jpegData(compressionQuality: 1) {
            let offerModel = CreateOfferModel(image: imageData, name: nameField.getText(), price: Float(priceField.getText()) ?? 0, buyer_id: selectBuyerID ?? 0)
            coordinator?.CreateOffer(offer_model: offerModel)
        }
    }
    

}

extension CreateOfferViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        self.imageView.image = image
    }
}
