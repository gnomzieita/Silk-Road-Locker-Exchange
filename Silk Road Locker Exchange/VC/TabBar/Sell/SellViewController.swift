//
//  SellViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 22.06.2022.
//

import UIKit

class SellViewController: RootViewController, UITableViewDelegate, UITableViewDataSource, LoadOffersProtocol, LoadDataProtocol  {

    var offers:[OfferDetails] = []
    
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
    
    
    weak var coordinator: SellCoordinator?
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBOutlet weak var table: UITableView!
    
    @IBAction func segmentChanged(_ sender: Any) {
        loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(.init(nibName: "ProductTableViewCell", bundle: .main), forCellReuseIdentifier: "ProductTableViewCell")
        // Do any additional setup after loading the view.
        table.reloadData()
        loadData()
    }
    
    func loadData() {
        switch segment.selectedSegmentIndex {
        case 0:
            coordinator?.loadSellOrders()
        case 1:
            coordinator?.loadSoldOrders()
        default:
            print("HZ")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coordinator?.errorDelegat = self
        coordinator?.LoadOffersDelegat = self
        coordinator?.loadDataDelegat = self
    }
    
    @IBAction func NewOffer(_ sender: Any) {
        coordinator?.NewOffer()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell

        let offerInfo:OfferDetails = offers[indexPath.row]
        cell.setInfo(offerInfo: offerInfo)
        
        cell.setStatus(status: offerInfo.status)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 157
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let offerInfo:OfferDetails = offers[indexPath.row]
        //PurchaseOffer
        switch segment.selectedSegmentIndex {
        case 0:
            if offerInfo.status == .sent {
                coordinator?.PurchaseOfferDeteil(offerDetails: offerInfo)
            }
        case 1:
            print("")
        default:
            print("HZ")
        }
        
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
