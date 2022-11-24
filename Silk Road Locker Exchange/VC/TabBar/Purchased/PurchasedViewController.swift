//
//  PurchasedViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 22.06.2022.
//

import UIKit

class PurchasedViewController: RootViewController, UITableViewDelegate, UITableViewDataSource, LoadDataProtocol, LoadOffersProtocol {
    
    weak var coordinator: PurchasedCoordinator?
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    var offers:[OfferDetails] = []
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(.init(nibName: "ProductTableViewCell", bundle: .main), forCellReuseIdentifier: "ProductTableViewCell")
        // Do any additional setup after loading the view.
        table.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coordinator?.errorDelegat = self
        coordinator?.loadDataDelegat = self
        coordinator?.loadOffersDelegat = self
        
        loadData()
    }
    
    func update(_ data: [OfferDetails]) {
        self.offers = data
        table.reloadData()
    }

    func update(_ data: [OrderModel]) {
        self.offers.removeAll()
        for order in data {
            if let offer = order.offer_details {
                self.offers.append(offer)
            }
        }
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        cell.setInfo(offerInfo: offers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 157
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let offerInfo:OfferDetails = offers[indexPath.row]
        //PurchaseOffer
        switch segmentControl.selectedSegmentIndex {
        case 0:
            print("")
        case 1:
            if offerInfo.status == .sent {
                coordinator?.PurchaseOfferDeteil(offerDetails: offerInfo)
            }
        default:
            print("HZ")
        }
        
    }
    
    @IBAction func segmentChange(_ sender: Any) {
        loadData()
    }
    
    func loadData() {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            coordinator?.loadPurchasedOrders()
        case 1:
            coordinator?.loadReceivedOrders()
        default:
            print("HZ")
        }
    }
}
