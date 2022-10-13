//
//  ChatsViewController.swift
//  Silk Road Locker Exchange
//
//  Created by Alex Agarkov on 23.06.2022.
//

import UIKit

class ChatsViewController: RootViewController, UITableViewDelegate, UITableViewDataSource {

    weak var coordinator: ChatCoordinator?
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell") as! ChatTableViewCell
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "chat", sender: indexPath.row)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userList" {
            let vc = segue.destination as! UserListViewController
            vc.isChatUsereList = true
        }
        
        if segue.identifier == "chat" {
            let vc = segue.destination as! ChatViewController
            vc.hidesBottomBarWhenPushed = true
        }
    }
    

}
