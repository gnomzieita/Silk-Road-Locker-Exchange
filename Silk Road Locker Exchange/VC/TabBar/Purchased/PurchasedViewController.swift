//
//  PurchasedViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 22.06.2022.
//

import UIKit

class PurchasedViewController: RootViewController, UITableViewDelegate, UITableViewDataSource, LoadDataProtocol {
    
    weak var coordinator: PurchasedCoordinator?
    var orders:[OrderModel] = []
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(.init(nibName: "ProductTableViewCell", bundle: .main), forCellReuseIdentifier: "ProductTableViewCell")
        // Do any additional setup after loading the view.
        table.reloadData()
        coordinator?.loadPurchasedOrders()
    }
    

    func update(_ data: [OrderModel]) {
        
        table.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell

        let orderInfo:OrderModel = orders[indexPath.row]
        cell.titleLabel.text = orderInfo.offer_details?.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 157
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detal", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as! PurchaseViewController
        vc.hidesBottomBarWhenPushed = true
        
    }
    

}
