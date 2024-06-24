//
//  ViewController.swift
//  Assignment17MVVM
//
//  Created by Ebillson Grand Jean on 6/16/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var buttonUsersList: UIButton!
    
    @IBOutlet weak var buttonUsersGrid: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func buttonUsersListTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let userslistViewController = storyboard.instantiateViewController(identifier: "UsersListViewControllerID") as UsersListViewController
        
        self.navigationController?.pushViewController(userslistViewController, animated: true)

    }
    
    @IBAction func buttonUsersGridTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let usersGridViewController = storyboard.instantiateViewController(identifier: "UsersGridViewControllerID") as UsersGridViewController
        
        self.navigationController?.pushViewController(usersGridViewController, animated: true)
    }
    
    
}

