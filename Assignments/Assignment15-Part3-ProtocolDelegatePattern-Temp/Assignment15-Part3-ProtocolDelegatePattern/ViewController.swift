//
//  ViewController.swift
//  Assignment15-Part3-ProtocolDelegatePattern
//
//  Created by Ebillson Grand Jean on 6/12/24.
//

/*
 
 Assignment 15 - part 3
 
 3.Show use of protocol delegate pattern by sending data back from 2nd screen to previous screen. Take any example of you choice
 
 */
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonGoToDetails: UIButton!
    
    @IBOutlet weak var labelDataFromDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToDetailsTapped(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let detailsViewController = storyBoard.instantiateViewController(identifier: "DetailsViewControllerID") as DetailsViewController
        
        detailsViewController.delegate = self
        
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}


extension ViewController:DataTransferProtocol {
    func sendDataBack(data: String) {
        
        // set label to data
        labelDataFromDetails.text = data
        
        print("Received Data is \(data)")
    }
}
