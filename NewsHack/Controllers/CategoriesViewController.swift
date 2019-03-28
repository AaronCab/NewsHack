//
//  CategoriesViewController.swift
//  NewsHack
//
//  Created by Aaron Cabreja on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    //MARK: - Outlets and Properties
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private var onlineCategories = ["business", "entertainment",  "general", "health", "science", "sports", "technology"]
    private var searchedCategories = [String]()
    private var searchBarIsEmpty = true
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSoruceAndDelegate()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailCategoriesViewController, let cell = sender as? CategoryCell,let indexPath = tableView.indexPath(for: cell) else {
            fatalError("error with segue")
        }
        if searchBarIsEmpty {
            let category = onlineCategories[indexPath.row]
            destination.onlineCategory = category
        } else {
            let category = searchedCategories[indexPath.row]
            destination.onlineCategory = category
        }
       
    }
    private func setupDataSoruceAndDelegate(){
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func setImage(imageName: String, cell: CategoryCell){
        switch imageName {
        case "business":
            cell.categoryImage.image = UIImage.init(named: "business")
        case "entertainment":
            cell.categoryImage.image = UIImage.init(named: "entertainment")
        case "general":
            cell.categoryImage.image = UIImage.init(named: "general")
        case "health":
            cell.categoryImage.image = UIImage.init(named: "health")
        case "science":
            cell.categoryImage.image = UIImage.init(named: "science")
        case "sports":
            cell.categoryImage.image = UIImage.init(named: "sports")
        case "technology":
            cell.categoryImage.image = UIImage.init(named: "technology")
        default:
            print("no image avaiable")
        }
    }
}
//MARK: - Extentions
//MARK: - UITableViewDelegate, UITableViewDataSource
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBarIsEmpty {
            return onlineCategories.count
        } else {
            return searchedCategories.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else {
            fatalError("TableCell is not connected")
        }
        if searchBarIsEmpty {
            cell.categoryNameLabel.text =  onlineCategories[indexPath.row]
            setImage(imageName: onlineCategories[indexPath.row], cell: cell)
        } else {
            cell.categoryNameLabel.text =  searchedCategories[indexPath.row]
            setImage(imageName: searchedCategories[indexPath.row], cell: cell)
        }
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
}
//MARK: - UISearchBarDelegate
extension CategoriesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        return
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            searchBarIsEmpty = true
        } else {
            searchBarIsEmpty = false
            searchBar.text = searchText.lowercased()
            searchedCategories = onlineCategories.filter{$0.lowercased().contains(searchText)}
            tableView.reloadData()
        }
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        tableView.reloadData()
        return true
    }
}
