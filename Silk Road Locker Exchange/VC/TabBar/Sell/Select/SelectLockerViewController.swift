//
//  SelectLockerViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 08.07.2022.
//

import UIKit

class SelectLockerViewController: RootViewController {

    weak var coordinator: PurchasedCoordinator?
    var digital_lockers: [DigitalLockersModel] = []
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var b10: UIButton!
    @IBOutlet weak var b11: UIButton!
    @IBOutlet weak var b12: UIButton!
    @IBOutlet weak var b13: UIButton!
    @IBOutlet weak var b14: UIButton!
    @IBOutlet weak var b15: UIButton!
    @IBOutlet weak var b16: UIButton!
    @IBOutlet weak var b17: UIButton!
    @IBOutlet weak var b18: UIButton!
    @IBOutlet weak var b19: UIButton!
    @IBOutlet weak var b20: UIButton!
    @IBOutlet weak var leftSide: UIButton!
    @IBOutlet weak var rightSide: UIButton!
    
    var ButtonsArray:[UIButton] = []
    
    
    override func viewDidLoad() {
        ButtonsArray = [b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b14,b15,b16,b17,b18,b19,b20,leftSide,rightSide]
        super.viewDidLoad()
        self.setBackButton()
        // Do any additional setup after loading the view.
        setupLockerInfo()
    }
    
    func setupLockerInfo() {
        for (index, locker) in ButtonsArray.enumerated() {
            if index < digital_lockers.count {
                let obj = digital_lockers[index]
                locker.setupStatus(status: obj.status)
            }
            else
            {
                locker.setupStatus(status: DigitalLockerStatusModel.none)
            }
        }
    }
    
    @IBAction func lockerTap(_ sender: UIButton) {
        let index = ButtonsArray.firstIndex(of: sender) ?? 0
        if index < digital_lockers.count {
            let obj = digital_lockers[index]
            if obj.status == .available {
                lockerSelected(locker_number: obj.id)
            }
        }
    }
    
    
    func lockerSelected(locker_number:Int)  {
        print(locker_number)
        coordinator?.PurchasOfer(locker_id: locker_number)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIButton {
    func setupStatus(status:DigitalLockerStatusModel?) {
        if let stat = status {
            switch stat {
            case .available:
                self.backgroundColor = #colorLiteral(red: 0.5450000167, green: 0.7450000048, blue: 0.1059999987, alpha: 1)
            case .occupied:
                self.backgroundColor = #colorLiteral(red: 0.9330000281, green: 0.5099999905, blue: 0.5099999905, alpha: 1)
            case .selected:
                self.backgroundColor = #colorLiteral(red: 0.1289999932, green: 0.7799999714, blue: 0.9840000272, alpha: 1)
            case .none:
                self.backgroundColor = #colorLiteral(red: 0.7409999967, green: 0.7409999967, blue: 0.7409999967, alpha: 1)
            }
        }
    }
}
