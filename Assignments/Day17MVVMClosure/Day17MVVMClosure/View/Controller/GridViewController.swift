//
//  GridViewController.swift
//  Assignment14
//
//  Created by Ebillson Grand Jean on 6/13/24.
//

import UIKit

class GridViewController: UIViewController {

    var users = ["Mark", "John", "Jean", "Jack", "Jane", "Mary", "Dana", "Joe", "Bill", "Marilyn", "Daniel", "Warren", "Ariana", "Mario", "Rodriguez", "Esther"]
    
    let listViewModel = ListViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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


extension GridViewController : UpdateUIProtocol {
    func refresh() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension GridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            users.count
        default:
            listViewModel.productsList.count
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCellID", for: indexPath) as? GridCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        switch indexPath.section {
        case 0:
            cell.labelTitleGridCell.text = users[indexPath.item]
        default:
            cell.labelTitleGridCell.text = listViewModel.productsList[indexPath.item].title
            cell.imageViewGridCell.image = UIImage(systemName: "storefront.circle")
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
}

extension GridViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(users[indexPath.item])
    }
}
