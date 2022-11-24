//
//  SelectLocationViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 08.07.2022.
//

import UIKit

class SelectLocationViewController: RootViewController, UITableViewDelegate, UITableViewDataSource, LoadLocationsProtocol {
    
    weak var coordinator: PurchasedCoordinator?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    func update(_ data: [LocationInfoModel]) {
        LocationArray = data
        table.reloadData()
    }
    
    var LocationArray:[LocationInfoModel] = []
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackButton()
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coordinator?.loadLocationsDelegat = self
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectLocationTableViewCell", for: indexPath) as! SelectLocationTableViewCell
        
        let cellInfo = LocationArray[indexPath.row]
        
        cell.loadData(model: cellInfo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellInfo = LocationArray[indexPath.row]
        print(cellInfo.digital_lockers)
        if let digital_lockers = cellInfo.digital_lockers, !digital_lockers.isEmpty {
            coordinator?.SelectLocker(digital_lockers: digital_lockers)
        }
    }
}

extension SelectLocationViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        coordinator?.getAdrresses(zip_code: searchBar.text ?? "")
    }
}
