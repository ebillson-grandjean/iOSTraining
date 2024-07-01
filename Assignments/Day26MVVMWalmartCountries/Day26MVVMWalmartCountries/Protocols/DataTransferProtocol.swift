//
//  DataTransferProtocol.swift
//  Day26MVVMWalmartCountries
//
//  Created by Ebillson Grand Jean on 6/27/24.
//

import Foundation


protocol DataTransferProtocol: NSObject {
    func didReceiveData(countries: [Country])
    func didReceiveError(error: Error)
}
