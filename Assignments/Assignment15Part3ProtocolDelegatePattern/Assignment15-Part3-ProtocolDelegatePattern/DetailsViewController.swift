//
//  DetailsViewController.swift
//  Assignment15-Part3-ProtocolDelegatePattern
//
//  Created by Ebillson Grand Jean on 6/12/24.
//

import UIKit


protocol DataTransferProtocol {
    func sendDataBack(data: String)
}


class DetailsViewController: UIViewController {
    @IBOutlet weak var buttonDetails: UIButton!
    
    var myData = "This is Data coming from my Details Screen"
    var delegate:DataTransferProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonDetailsTapped(_ sender: Any) {
        
        delegate?.sendDataBack(data: myData)
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
