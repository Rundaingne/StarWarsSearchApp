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
        searchableObjectsCollectionView.delegate = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "milkyway")!)
        searchResultsTableView.backgroundColor = self.view.backgroundColor
        SearchableObjectController.shared.searchObject(with: .person, returnType: Person.self, searchTerm: "") { (people) in
            DispatchQueue.main.async {
                guard let people = people else {return}
                self.objects = people
                self.searchResultsTableView.reloadData()
            }
        }
    }
    
    //MARK: -Properties
    let objectTypes: [SearchCategory] = [.person, .planet, .starship, .vehicle]
    var objects: [SearchableObject] = []
    
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
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultsCell", for: indexPath)
        let object = objects[indexPath.row]
        cell.textLabel?.text = object.name
        cell.backgroundColor = self.view.backgroundColor
        cell.selectionStyle = .none
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

extension SearchPageViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let searchCategory = objectTypes[indexPath.row]
        switch searchCategory {
        case .person:
            SearchableObjectController.shared.searchObject(with: .person, returnType: Person.self, searchTerm: "") { (people) in
                DispatchQueue.main.async {
                    guard let people = people else {return}
                    self.objects = people
                    self.searchResultsTableView.reloadData()
                }
            }
            
        case .planet:
            SearchableObjectController.shared.searchObject(with: .planet, returnType: Planet.self, searchTerm: "") { (planets) in
                DispatchQueue.main.async {
                    guard let planets = planets else {return}
                    self.objects = planets
                    self.searchResultsTableView.reloadData()
                }
            }
        case .starship:
            SearchableObjectController.shared.searchObject(with: .starship, returnType: Starship.self, searchTerm: "") { (starships) in
                DispatchQueue.main.async {
                    guard let starships = starships else {return}
                    self.objects = starships
                    self.searchResultsTableView.reloadData()
                }
            }
        case .vehicle:
            SearchableObjectController.shared.searchObject(with: .vehicle, returnType: Vehicle.self, searchTerm: "") { (vehicles) in
                DispatchQueue.main.async {
                    guard let vehicles = vehicles else {return}
                    self.objects = vehicles
                    self.searchResultsTableView.reloadData()
                }
            }
        }
    }
}

extension SearchPageViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //When the text in the search bar changes, I need to...call the appropriate fetch function. Which means I will have to switch on the button that was pressed. Oh boy, wow. I will implement this later.
    }
}

