//
//  GridViewController.swift
//  Assignment14
//
//  Created by Ebillson Grand Jean on 6/13/24.
//

import UIKit

class GridViewController: UIViewController {

    var users = ["Mark", "John", "Jean", "Jack", "Jane", "Mary", "Dana", "Joe", "Bill", "Marilyn", "Daniel", "Warren", "Ariana", "Mario", "Rodriguez", "Esther"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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


extension GridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCellID", for: indexPath) as! GridCollectionViewCell
        
        cell.labelTitleGridCell.text = users[indexPath.item]
        return cell
    }
    
    
}

extension GridViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(users[indexPath.item])
    }
}
