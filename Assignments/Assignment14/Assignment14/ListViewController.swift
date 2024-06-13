//
//  ListViewController.swift
//  Assignment14
//
//  Created by Ebillson Grand Jean on 6/12/24.
//

import UIKit

class ListViewController: UIViewController {

    var loggedInUserEmail: String = ""
    var cities = ["New York City", "San Francisco", "Los Angeles", "Seattle", "Miami", "Paris", "London", "Barcelona", "Dubai", "Tokyo", "Shangai", "Kigali", "Mexico", "Port-au-Prince", "Cap-Haitien", "Toronto", "Athens", "Manchester"]
    
    var countries = ["United States of America", "United Kingdom", "Canada", "Haiti", "Rwanda", "Nigeria", "Spain", "Mexico", "Bahamas", "Brazil", "Greece", "Japan", "China"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let cellXIB = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(cellXIB, forCellReuseIdentifier: "CustomTableViewCellID")
    }
    
    
    
    func setup(){
        
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


extension ListViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return cities.count
        }else {
            return countries.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
       
        var data = ""
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! ListTableViewCell

            data = cities[indexPath.row]
            //        cell.textLabel?.text = loggedInUserEmail
            //        cell.nameLabel?.text = "\(loggedInUserEmail) #\(indexPath.row)"
            cell.nameLabel?.text = data
            return cell
            
        }else {
            let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCellID", for: indexPath) as! CustomTableViewCell

            data = countries[indexPath.row]
            customCell.labelTitle?.text = data
            customCell.labelDetailsInfo?.text = "\(indexPath.row)"
            customCell.imageViewInfo.image = UIImage(systemName: "globe")
            return customCell
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 10, y: 5, width: 200, height: 30))
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: 180, height: 20))
        headerView.addSubview(label)
        headerView.backgroundColor = .tintColor
        label.textColor = .white
        
        if section == 0 {
            label.text = "Cities"
        } else {
            label.text = "Countries"
        }
        
        return headerView
    }
}


extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var data = ""
        if indexPath.section == 0 {
            data = cities[indexPath.row]
        }else {
            data = countries[indexPath.row]
        }
        print(data)
    }
}
