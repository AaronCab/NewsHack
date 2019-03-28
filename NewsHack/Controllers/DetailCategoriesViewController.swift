//
//  DetailCategoriesViewController.swift
//  NewsHack
//
//  Created by Aaron Cabreja on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailCategoriesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var onlineArticles = [ArticleWrapper](){
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    var countryName = CountryNames.Australia
    var countryInitals: String?
    var onlineCategory: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        //CategoriesNewsFeedCell
        setupDelegateAndDataSource()
        getNewsByCategory(countryName: CountryNames.Argentina.rawValue)
    }
    private func setupDelegateAndDataSource(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    private func getNewsByCategory(countryName: String){
        ApiClient.getTopHeadlineByCategory(country: countryName, categories: onlineCategory) { [weak self] (articles, appError) in
            if let articles = articles {
                self?.onlineArticles = articles
                print("number of articles \(articles.count)")
            }
            
            if let appError = appError {
                print("appError in the detail vc for categories : \(appError.localizedDescription)")
            }
        }
    }
    
    @IBAction func unwindFromCountryCategoryViewController(_ segue: UIStoryboardSegue){
        let sourceController = segue.source as! CountryCategoryViewController
        guard let country = sourceController.usernameLabel.text else {
            fatalError("No Country Name")
        }
        //countryName = country
        countryInitals = sourceController.selectedCountry.rawValue
        navigationItem.title = "Articles From \(country)"
        getNewsByCategory(countryName: countryInitals ?? "us")
        collectionView.reloadData()
    }
}
extension DetailCategoriesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onlineArticles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesNewsFeedCell", for: indexPath) as? CategoriesNewsFeedCell else {
            fatalError("CategoriesNewsFeedCell is nil")
        }
        let aritcle = onlineArticles[indexPath.row]
        cell.titleLabel.text = "Title: \(aritcle.title)"
        cell.descriptionLabel.text = "Description: \(aritcle.description)"
        return cell
    }


}
