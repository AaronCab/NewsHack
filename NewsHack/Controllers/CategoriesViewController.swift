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
    private var onlineArticles = [ArticleWrapper](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
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
}
//MARK: - Extentions
//MARK: - UITableViewDelegate, UITableViewDataSource
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
//MARK: - UISearchBarDelegate
extension CategoriesViewController: UISearchBarDelegate {
    
}
