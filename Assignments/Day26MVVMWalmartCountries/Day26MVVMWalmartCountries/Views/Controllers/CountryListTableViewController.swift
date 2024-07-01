//
//  CountryListTableViewController.swift
//  Day26MVVMWalmartCountries
//
//  Created by Ebillson Grand Jean on 6/27/24.
//

import UIKit

class CountryListTableViewController: UIViewController {

    @IBOutlet weak var searchBarCountryNameCapital: UISearchBar!
    @IBOutlet weak var countriesTableView: UITableView!
    let countryViewModel = CountryViewModel()
    
//    var searchActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(doRefresh), for: .valueChanged)
        
        // this is the replacement of implementing: "collectionView.addSubview(refreshControl)"
        countriesTableView.refreshControl = refreshControl
        
        // Do any additional setup after loading the view.
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
        searchBarCountryNameCapital.delegate = self
        
        let xib = UINib(nibName: IDConstants.CustomCountryTableViewCell, bundle: nil)
        countriesTableView.register(xib, forCellReuseIdentifier: IDConstants.CustomCountryTableViewCellID)
        
        
        print("ooooooo")
        countryViewModel.refreshViewClosure = {
            DispatchQueue.main.async {
                self.countriesTableView.reloadData()
            }
        }
        countryViewModel.getCountriesDataWithProtocolDelegate()
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if countryViewModel.hasNetworkError == true {
            print("aaaaaa")
            showError()
            return
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
    
    @objc func doRefresh(refreshControl: UIRefreshControl) {
        countryViewModel.getCountriesDataWithProtocolDelegate()
        // somewhere in your code you might need to call:
        refreshControl.endRefreshing()
    }
    
    
    func showError(){
        
        print("Showing Error...")
        
        let alert = UIAlertController(title: "API Call Error!", message: "The API Call failed.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Retry", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"API Failure\" alert occured.")
            
            self.countryViewModel.getCountriesDataWithProtocolDelegate()
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension CountryListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(countryViewModel.countries)
        return countryViewModel.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: IDConstants.CustomCountryTableViewCellID, for: indexPath) as! CustomCountryTableViewCell
        
        let country = countryViewModel.countries[indexPath.row]
        
//        let imageURL = URL(string: country.flag)
//        
//        DispatchQueue.global().async{
//            let imageData = try? Data(contentsOf: imageURL!)
//            
//            DispatchQueue.main.async{
//                customCell.countryFlag.image = UIImage(data: imageData!)
//            }
//        }
        
        
//        DispatchQueue.global().async { 
//            let imageURL = URL(string: country.flag)
//
//            if let data = try? Data(contentsOf: imageURL!) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        customCell.countryFlag.image = image
//                    }
//                }
//            }
//        }
        
        customCell.countryInfos.text = "\(country.name), \(country.region), \(country.code)"
        customCell.countryCapital.text = country.capital
        
        return customCell
    }
}



extension CountryListTableViewController: UITableViewDelegate{
    
}


extension CountryListTableViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        countryViewModel.isSearching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        countryViewModel.isSearching = false
    }
    
    private func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        countryViewModel.isSearching = false;
        searchBar.text = nil
        searchBar.resignFirstResponder()
        countriesTableView.resignFirstResponder()
        self.searchBarCountryNameCapital.showsCancelButton = false
        countriesTableView.reloadData()
    }

    private func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        countryViewModel.isSearching = false
    }

    private func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Check if the searched text has at least 1 character otherwise show all results
        guard searchText != "" else {
            print("Empty")
            countryViewModel.isSearching = false
            countryViewModel.getCountriesDataWithProtocolDelegate()
            return
        }
        
        print("Not Empty")
        
        countryViewModel.filterCountriesByNameOrCapital(nameOrCapital: searchText)
        countryViewModel.isSearching = true
        countriesTableView.reloadData()
    }
}
