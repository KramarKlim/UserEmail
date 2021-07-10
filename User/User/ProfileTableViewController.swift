//
//  ProfileTableViewController.swift
//  User
//
//  Created by Клим on 14.06.2021.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    var profile: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = profile?.email
        return cell
    }
    
}
