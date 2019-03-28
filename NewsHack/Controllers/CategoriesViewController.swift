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
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSoruceAndDelegate()
        
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
        return onlineCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else {
            fatalError("TableCell is not connected")
        }
        cell.categoryNameLabel.text =  onlineCategories[indexPath.row]
        setImage(imageName: onlineCategories[indexPath.row], cell: cell)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
}
//MARK: - UISearchBarDelegate
extension CategoriesViewController: UISearchBarDelegate {
    
}
