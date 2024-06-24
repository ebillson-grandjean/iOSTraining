//
//  ProductsListTableViewController.swift
//  Assignment19-MVVM
//
//  Created by Ebillson Grand Jean on 6/19/24.
//

import UIKit

class ProductsListTableViewController: UIViewController {

    @IBOutlet weak var productsTableView: UITableView!
    let productViewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        productsTableView.dataSource = self
        productsTableView.delegate = self
        
        
        let xib = UINib(nibName: "CustomProductTableViewCell", bundle: nil)
        productsTableView.register(xib, forCellReuseIdentifier: IDConstants.CustomProductTableViewCellID)
        
        productViewModel.refreshViewClosure = {
            DispatchQueue.main.async {
                self.productsTableView.reloadData()
            }
        }
        
        productViewModel.getUsersDataWithProtocolDelegate()
        
    }
   

}


extension ProductsListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: IDConstants.CustomProductTableViewCellID, for: indexPath) as! CustomProductTableViewCell
        
        let product = productViewModel.products[indexPath.row]
//
//        let imageString = user.avatar
//        let imageURL = URL(string: imageString)
//        let data = try? Data(contentsOf: imageURL!)
//        
               
        
//        customCell.imageViewName.image = UIImage(data: data!)
        customCell.productImageView.image = UIImage(systemName: "bag.fill")
        customCell.productImageView.tintColor = .cyan
        

        customCell.productNameLabel.text = product.title
        customCell.productPriceLabel.text = String("$\(product.price)")

        return customCell
    }
}



extension ProductsListTableViewController: UITableViewDelegate {
    
    
}
