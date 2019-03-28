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
    var onlineCategory: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        //CategoriesNewsFeedCell
        setupDelegateAndDataSource()
        getNewsByCategory()
    }
    private func setupDelegateAndDataSource(){
//        collectionView.delegate = self
//        collectionView.dataSource = self
    }
    private func getNewsByCategory(){
        ApiClient.getTopHeadlineByCategory(country: CountryNames.Argentina.rawValue, categories: onlineCategory) { (articles, appError) in
            if let articles = articles {
                print("number of articles\(articles.count)")
            }
            if let appError = appError {
                print("appError in the detail vc for categories : \(appError.localizedDescription)")
            }
        }
    }
}
//extension DetailCategoriesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//}
