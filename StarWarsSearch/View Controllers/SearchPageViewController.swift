//
//  SearchPageViewController.swift
//  AestheticsPractice
//
//  Created by Brooke Kumpunen on 4/18/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

//To this page, I will need to add a collection view outlet, table view outlet, appropriate data source functions, and a method of populating the number of searchable objects in the collection view. I'll have to make a custom cell to hold an image and a label with the name property. As well as labels for whatever else I have, like the two buttons and the label above the cell.

import UIKit

class SearchPageViewController: UIViewController, UITableViewDataSource, UICollectionViewDataSource {
    
    //MARK: -IBOutlets
    @IBOutlet weak var starWarsSearchBar: UISearchBar!
    @IBOutlet weak var searchableObjectsCollectionView: UICollectionView!
    @IBOutlet weak var searchResultsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starWarsSearchBar.delegate = self
        searchableObjectsCollectionView.dataSource = self
        searchResultsTableView.dataSource = self
    }
    
    let objectTypes: [SearchCategory] = [.person, .planet, .starship, .vehicle]
    var object: SearchableObject?
    
    //MARK: -DataSource functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objectTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as! SearchableObjectCollectionViewCell
        let objectType = objectTypes[indexPath.row]
        cell.updateViews(with: objectType)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultsCell", for: indexPath)
        
        return cell
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

extension SearchPageViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //When the text in the search bar changes, I need to...call the appropriate fetch function. Which means I will have to switch on the button that was pressed. Oh boy, wow. I will implement this later.
    }
}

