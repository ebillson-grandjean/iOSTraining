//
//  ListViewController.swift
//  Assignment14
//
//  Created by Ebillson Grand Jean on 6/12/24.
//

import UIKit



protocol UpdateUIProtocol:NSObject {
    func refresh()
}
class ListViewController: UIViewController {

    var loggedInUserEmail: String = ""
    var cities = ["New York City", "San Francisco", "Los Angeles", "Seattle", "Miami", "Paris", "London", "Barcelona", "Dubai", "Tokyo", "Shangai", "Kigali", "Mexico", "Port-au-Prince", "Cap-Haitien", "Toronto", "Athens", "Manchester"]
    
    var countries = ["United States of America", "United Kingdom", "Canada", "Haiti", "Rwanda", "Nigeria", "Spain", "Mexico", "Bahamas", "Brazil", "Greece", "Japan", "China"]
    
    @IBOutlet weak var tableView: UITableView!
    
    let listViewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let cellXIB = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(cellXIB, forCellReuseIdentifier: "CustomTableViewCellID")
        listViewModel.myDelegate = self
        listViewModel.readDataFromJSONFile()
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


extension ListViewController:UpdateUIProtocol {
    func refresh() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ListViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return cities.count
        case 1:
            return countries.count
        default:
//            return listViewModel.usersList.count
            return listViewModel.productsList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var data = ""

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! ListTableViewCell

            data = cities[indexPath.row]
            //        cell.textLabel?.text = loggedInUserEmail
            //        cell.nameLabel?.text = "\(loggedInUserEmail) #\(indexPath.row)"
            cell.nameLabel?.text = data
            return cell
        case 1:
            return self.tableViewForCountries(tableView, cellForRowAt: indexPath)
        default:
            return self.tableViewForProduct(tableView, cellForRowAt: indexPath)
            
        }
       
//        if indexPath.section == 0 {
//            
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! ListTableViewCell
//
//            data = cities[indexPath.row]
//            //        cell.textLabel?.text = loggedInUserEmail
//            //        cell.nameLabel?.text = "\(loggedInUserEmail) #\(indexPath.row)"
//            cell.nameLabel?.text = data
//            return cell
//            
//        }else {
//            let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCellID", for: indexPath) as! CustomTableViewCell
//
//            data = countries[indexPath.row]
//            customCell.labelTitle?.text = data
//            customCell.labelDetailsInfo?.text = "\(indexPath.row)"
//            customCell.imageViewInfo.image = UIImage(systemName: "globe")
//            return customCell
//        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        let label = UILabel(frame: CGRect(x: 0, y: 15, width: 200, height: 20))
        label.textAlignment = .center
        headerView.addSubview(label)
        headerView.backgroundColor = .tintColor
        label.textColor = .white
        
        switch section {
        case 0:
            label.text = "Cities"
        case 1:
            label.text = "Countries"
        default:
            label.text = "Products"
        }
        
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func tableViewForCountries(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCellID", for: indexPath) as! CustomTableViewCell
       
        let data = countries[indexPath.row]
        customCell.labelTitle?.text = data
        customCell.labelDetailsInfo?.text = "\(indexPath.row)"
        customCell.imageViewInfo.image = UIImage(systemName: "globe")
        return customCell
        
    }
    
    
    func tableViewForUser(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCellID", for: indexPath) as! CustomTableViewCell
       
        let data = listViewModel.usersList[indexPath.row]
        customCell.labelTitle?.text = data.name
        customCell.labelDetailsInfo?.text = data.email
        customCell.imageViewInfo.image = UIImage(systemName: "person.circle.fill")
        return customCell
        
    }
    
    func tableViewForProduct(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCellID", for: indexPath) as! CustomTableViewCell
       
        let data = listViewModel.productsList[indexPath.row]
        customCell.labelTitle?.text = data.title
        customCell.labelDetailsInfo?.text = data.category
        customCell.imageViewInfo.image = UIImage(systemName: "storefront.circle")
        return customCell
        
    }
    
    
    
}


extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var data = ""
        
        if indexPath.section == 0 {
            data = cities[indexPath.row]
        }else if indexPath.section == 1{
            data = countries[indexPath.row]
        }else {
            data = listViewModel.productsList[indexPath.row].title
        }
        print(data)
    }
}
