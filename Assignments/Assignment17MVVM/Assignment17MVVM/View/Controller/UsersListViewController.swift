//
//  UsersListViewController.swift
//  Assignment17MVVM
//
//  Created by Ebillson Grand Jean on 6/17/24.
//

import UIKit

class UsersListViewController: UIViewController {
    
    @IBOutlet weak var usersTableView: UITableView!
    
    let userViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usersTableView.dataSource = self
        usersTableView.delegate = self
        
        let xib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        usersTableView.register(xib, forCellReuseIdentifier: IDConstants.CustomTableViewCellID)
        
        userViewModel.getUsersData {
            DispatchQueue.main.async {
                self.usersTableView.reloadData()
            }
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


extension UsersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: IDConstants.CustomTableViewCellID, for: indexPath) as! CustomTableViewCell
        
        let user = userViewModel.users[indexPath.row]
        
        let imageString = user.avatar
        let imageURL = URL(string: imageString)
        let data = try? Data(contentsOf: imageURL!)
        
        
        
        customCell.labelName?.text = user.firstName + " " + user.lastName
        customCell.labelEmail?.text = user.email
        customCell.imageViewName.image = UIImage(data: data!)
        customCell.imageViewName.image?.withTintColor(.cyan)
        return customCell
    }
}



extension UsersListViewController: UITableViewDelegate {
    
    
}
