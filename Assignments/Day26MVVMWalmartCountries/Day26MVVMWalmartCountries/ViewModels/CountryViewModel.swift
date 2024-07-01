//
//  CountryViewModel.swift
//  Day26MVVMWalmartCountries
//
//  Created by Ebillson Grand Jean on 6/27/24.
//

import Foundation


protocol CountryViewModelActions {
    func filterCountriesByNameOrCapital(nameOrCapital: String)
}


class CountryViewModel: NSObject {
    
    let networkManager = NetworkManager()
    var countries = [Country]()
    var originalCountries = [Country]()
    var refreshViewClosure: (()-> Void)?
    var isSearching = false
    var hasNetworkError = false
    
    
    
    func getCountriesDataWithProtocolDelegate(){
        
        guard let url = URL(string: APIConstants.APIBaseURL + APIConstants.CountriesEndPoint) else {
            print("=== WRONG URL ===")
            return
        }
    
        networkManager.delegate = self
        networkManager.getDataFromAPIUsingProtocolDelegate(url: url)
        
    }
}


extension CountryViewModel: DataTransferProtocol {
    
    func didReceiveData(countries: [Country]) {
        self.countries = countries
        self.originalCountries = self.countries
        refreshViewClosure?()
    }
    
    func didReceiveError(error: any Error) {
        print("=== INSIDE ERROR ===")
        print(error.localizedDescription)
        hasNetworkError = true
        print("hasNetworkError \(hasNetworkError)")
    }
}


extension CountryViewModel: CountryViewModelActions {
    
    func filterCountriesByNameOrCapital(nameOrCapital: String) {
        if nameOrCapital.isEmpty {
            print("Searched text is empty")
            countries = self.originalCountries
        }else {
            print("Searched text is not empty")
            countries = self.countries.filter { country in
                return country.name.localizedCaseInsensitiveContains(nameOrCapital)
                    || country.capital.localizedCaseInsensitiveContains(nameOrCapital)
            }
        }
    }
    
}
