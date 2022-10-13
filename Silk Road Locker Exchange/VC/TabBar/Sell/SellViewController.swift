//
//  SellViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 22.06.2022.
//

import UIKit

class SellViewController: RootViewController, UITableViewDelegate, UITableViewDataSource  {
    
    weak var coordinator: SellCoordinator?
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var table: UITableView!
    
    @IBAction func segmentChanged(_ sender: Any) {
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(.init(nibName: "ProductTableViewCell", bundle: .main), forCellReuseIdentifier: "ProductTableViewCell")
        // Do any additional setup after loading the view.
        table.reloadData()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell

        cell.titleLabel.text = "Text"
        if segment.selectedSegmentIndex == 0 {
            cell.setStatus(status: .PendingResponse)
        }
        else {
            cell.setStatus(status: .PendingPickup)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 157
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "OfferDetails", sender: nil)
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
