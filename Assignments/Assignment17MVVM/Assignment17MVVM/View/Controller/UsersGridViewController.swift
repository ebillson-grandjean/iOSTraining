//
//  UsersGridViewController.swift
//  Assignment17MVVM
//
//  Created by Ebillson Grand Jean on 6/17/24.
//

import UIKit

class UsersGridViewController: UIViewController {

    @IBOutlet weak var userCollectionView: UICollectionView!
    
    let userslistViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        userslistViewModel.getUsersDataWithProtocolDelegate {
//            DispatchQueue.main.async {
//                self.userCollectionView.reloadData()
//            }
//        }
        
        userslistViewModel.refreshViewClosure = {
            DispatchQueue.main.async {
                self.userCollectionView.reloadData()
            }
        }
        
        userslistViewModel.getUsersDataWithProtocolDelegate()
        
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


extension UsersGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 15
        return userslistViewModel.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IDConstants.UserCollecionViewCellID, for: indexPath) as? UsersGridCollectionViewCell else {
            return UICollectionViewCell()
        }
        let userItem = userslistViewModel.users[indexPath.item]
        cell.labelUserName.text = userItem.firstName + " " + userItem.lastName
        cell.imageViewUser.image = UIImage(systemName: "person.circle.fill")
        
        return cell
    }
    
    
    
}


extension UsersGridViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(userslistViewModel.users[indexPath.row])
    }
}
