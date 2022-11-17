//
//  SelectLocationViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 08.07.2022.
//

import UIKit

class SelectLocationViewController: RootViewController, UITableViewDelegate, UITableViewDataSource, LoadLocationsProtocol {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    func update(_ data: [LocationInfoModel]) {
        LocationArray = data
        table.reloadData()
    }
    
    var LocationArray:[LocationInfoModel] = []

    weak var coordinator: SellCoordinator?
    
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
        return LocationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectLocationTableViewCell", for: indexPath) as! SelectLocationTableViewCell
        
        let cellInfo = LocationArray[indexPath.row]
        
        cell.loadData(model: cellInfo)
        return cell
    }
}

extension SelectLocationViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        coordinator?.getAdrresses(zip_code: searchBar.text ?? "")
    }
}
