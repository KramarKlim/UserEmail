//
//  MainCollectionViewController.swift
//  User
//
//  Created by Клим on 12.06.2021.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    private var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
        
    }
    
    // MARK: UICollectionViewDataSource
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        let user = users[indexPath.row]
        cell.mainLabel.text = user.name
        
        
        return cell
    }
    private func makeRequest() {
        Request.shared.fetchData { users in
            self.users = users
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        guard let profileVC = self.storyboard?.instantiateViewController(identifier: "ProfileTableViewController") as? ProfileTableViewController else { return }
        profileVC.profile = user
        self.navigationController?.pushViewController(profileVC, animated: false)
    }
    
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
