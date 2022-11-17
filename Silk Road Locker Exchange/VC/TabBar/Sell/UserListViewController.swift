//
//  UserListViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 06.07.2022.
//

import UIKit

class UserListViewController: RootViewController, LoadBuyersProtocol, UITableViewDelegate, UITableViewDataSource {
    
    weak var coordinator: SellCoordinator?

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var table: UITableView!
    var buyers:[BuyerModel] = []
    
    var isChatUsereList:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.titleLabel.text = isChatUsereList ? "Select user to start the chat" : "Find your buyer"
        coordinator?.getBuyers()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coordinator?.loadBuyerDelegat = self
    }
    
    @IBAction func closeButtonTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func update(_ data: [BuyerModel]) {
        self.buyers = data
        self.table.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buyers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
        let info = buyers[indexPath.row]
        cell.userNameLabel.text = info.first_name + " " + info.last_name
        if let url = info.getProfileUrl() {
            cell.avatarImage.setImage(url: url)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Users"
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: return user
        let info = buyers[indexPath.row]
        coordinator?.selectBuyer(buyer: info)
    }
}
