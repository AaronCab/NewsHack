//
//  ViewController.swift
//  NewsHack
//
//  Created by Aaron Cabreja on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import SafariServices


class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBarLabel: UISearchBar!
    private var articles = [ArticleWrapper](){
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    private var gradient: CAGradientLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        searchBarLabel.delegate = self
        collectionView.delegate = self
        hideKeyboardWhenTappedAround()
        getArticles(keyword: "basketball")
        addGradient()
    }
    private func getArticles(keyword: String){
        ApiClient.getAllArticles(query: keyword) { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.articles = data
            }
        }
    }
    private func addGradient(){
        
        let firstColor = UIColor.init(red: 255/255, green: 0/255, blue: 204/255, alpha: 1)
        let secondColor = UIColor.init(red: 51/255, green: 51/255, blue: 153/255, alpha: 1)
        gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as? NewsFeedCell else {return UICollectionViewCell()}
        let thisArticle = articles[indexPath.row]
        cell.sourceLabel.text = "Source: \(thisArticle.source.name)"
        cell.titleLabel.text = "Title: \(thisArticle.title)"
        cell.DescriptionLabel.text = "Description: \(thisArticle.description)"
        ImageHelper.fetchImageFromNetwork(urlString: thisArticle.urlToImage) { (error, data) in
            if let error = error{
                print(error.errorMessage())
            } else if let data = data {
                cell.newsFeedImage.image = data
            }
        }
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let url = URL(string: articles[indexPath.row].url) else {
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize.init(width: 400, height: 400)
        
    }
    
   
    
}

extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        articles = [ArticleWrapper]()
        let searchText = searchBar.text
        if searchText == "" {
            return
        } else {
            getArticles(keyword: searchText!)
        }
    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        articles = [ArticleWrapper]()
//        if searchText == "" {
//            return
//        } else {
//            getArticles(keyword: searchText)
//        }
//
//    }
    
}

