//
//  MenuViewController.swift
//  Assignment14
//
//  Created by Ebillson Grand Jean on 6/13/24.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var buttonListView: UIButton!
    
    @IBOutlet weak var buttonGridView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func buttonListViewTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let listViewController = storyboard.instantiateViewController(identifier: "ListViewControllerID") as ListViewController
        
//        let listViewController = storyboard.instantiateViewController(withIdentifier: "ListViewControllerID") as! ListViewController
        
        
        listViewController.loggedInUserEmail = "Admin"
        
//        self.navigationController?.present(listViewController, animated: true)
        self.navigationController?.pushViewController(listViewController, animated: true)
        
    }
    
    @IBAction func buttonGridViewTapped(_ sender: Any) {
        performSegue(withIdentifier: "GridViewSegue", sender: sender)
    }
    
    
    

}
