//
//  DetailCategoriesViewController.swift
//  NewsHack
//
//  Created by Aaron Cabreja on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import SafariServices
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
    private var gradient: CAGradientLayer!
    override func viewDidLoad() {
        super.viewDidLoad()

        //CategoriesNewsFeedCell
        addGradient()
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
    private func addGradient(){
        
        let firstColor = UIColor.init(red: 255/255, green: 0/255, blue: 204/255, alpha: 1)
        let secondColor = UIColor.init(red: 51/255, green: 51/255, blue: 153/255, alpha: 1)
        gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
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
          return UICollectionViewCell()}
        
        let aritcle = onlineArticles[indexPath.row]
      if let thisTitle = aritcle.title{
        cell.titleLabel.text = "Title: \(thisTitle)"

      } else {
        cell.titleLabel.text = "Title: Not Available"

      }
      if let thisDescription = aritcle.description {
        cell.descriptionLabel.text = "Description: \(thisDescription)"

      } else {
      cell.descriptionLabel.text = "Description: No description"
      }

      if let articleImage = aritcle.urlToImage{
      ImageHelper.fetchImageFromNetwork(urlString: articleImage) { (error, data) in
            if let error = error{
                print(error.errorMessage())
            } else if let data = data {
                cell.newsFeedImage.layer.borderWidth = 5
                cell.newsFeedImage.layer.borderColor = UIColor.white.cgColor
                cell.newsFeedImage.image = data
            }
        }
        
      } else {
        cell.newsFeedImage.image = UIImage(named: "NewsHack")
      }
        return cell
    }


}
extension DetailCategoriesViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let saveAction = UIAlertAction.init(title: "Save Image", style: .default) { [unowned self] (alert) in
          ImageHelper.fetchImageFromNetwork(urlString: self.onlineArticles[indexPath.row].urlToImage!, completion: { (error, image) in
                if let error = error {
                    print(error.errorMessage())
                } else if let image = image {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)

                }
            })
        }
        let safariAction = UIAlertAction(title: "Safari", style: .default) { alert in
          guard let url = URL(string: self.onlineArticles[indexPath.row].url!) else {
                return
            }
            
            let safariVC = SFSafariViewController(url: url)
            self.present(safariVC, animated: true, completion: nil)
        }
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        alertController.addAction(safariAction)
        present(alertController, animated: true)
       
    }
    
    
    
}
