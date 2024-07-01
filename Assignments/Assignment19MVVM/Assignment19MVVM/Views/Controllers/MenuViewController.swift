//
//  ViewController.swift
//  Assignment19-MVVM
//
//  Created by Ebillson Grand Jean on 6/19/24.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var viewProductsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func viewProductsButtonTapped(_ sender: Any) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let productsListViewController = storyboard.instantiateViewController(identifier: IDConstants.ProductsListViewControllerID) as ProductListTableViewController
        
        self.navigationController?.pushViewController(productsListViewController, animated: true)
    }
    
}

