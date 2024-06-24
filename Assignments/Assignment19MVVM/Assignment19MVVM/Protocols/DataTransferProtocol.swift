//
//  DataTransferProtocol.swift
//  Assignment19-MVVM
//
//  Created by Ebillson Grand Jean on 6/19/24.
//

import Foundation

protocol DataTransferProtocol: NSObject {
    func didReceiveData(productsResponse: ProductsResponse)
    func didReceiveError(error: Error)
}
