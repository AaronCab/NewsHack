//
//  FavoritesViewController.swift
//  NewsHack
//
//  Created by Aaron Cabreja on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import SafariServices
class FavoritesViewController: UIViewController {
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    let favoriteCell = FavoriteCell()
    
    
    private var favoriteNews = [FavoritesModel]() {
        didSet {
            DispatchQueue.main.async {
                self.favoriteCollectionView.reloadData()
            }
        }
    }
    private var gradient: CAGradientLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favoriteCollectionView.delegate = self
        self.favoriteCollectionView.dataSource = self
        addGradient()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavorites()
    }
    private func addGradient(){
        
        let firstColor = UIColor.init(red: 255/255, green: 0/255, blue: 204/255, alpha: 1)
        let secondColor = UIColor.init(red: 51/255, green: 51/255, blue: 153/255, alpha: 1)
        gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    func loadFavorites() {
        self.favoriteNews = ItemsDataManager.fetchItemsFromDocumentsDirectory()
    }
}

extension FavoritesViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemsDataManager.fetchItemsFromDocumentsDirectory().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCell else {return UICollectionViewCell()}
            let favorite = ItemsDataManager.fetchItemsFromDocumentsDirectory()[indexPath.row]
            ImageHelper.fetchImageFromNetwork(urlString: favorite.imageURL.absoluteString) { (error, image) in
                if let error = error {
                    print(error.errorMessage())
                } else if let image = image {
                    cell.favoriteImage.layer.borderWidth = 5
                    cell.favoriteImage.layer.borderColor = UIColor.white.cgColor
                    cell.favoriteImage.image = image
                }
            }
        cell.titleLabel.text = favorite.title
        cell.authorLabel.text = favorite.author
        cell.descriptionTextView.text = favorite.description
        return cell
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { alert in
            self.confirmDeletionActionSheet(handler: { (deleteAction) in
                self.deleteFavorite(indexPath: indexPath)
                collectionView.reloadData()
            })
          
        }
        let safariAction = UIAlertAction(title: "Safari", style: .default) { alert in
            let favorite = ItemsDataManager.fetchItemsFromDocumentsDirectory()[indexPath.row]
            let url = favorite.url
            
            let safariVC = SFSafariViewController(url: url)
            self.present(safariVC, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        alertController.addAction(safariAction)
        present(alertController, animated: true)
    }
    
    private func deleteFavorite(indexPath: IndexPath) {
        let favoriteArticle = favoriteNews[indexPath.row]
        ItemsDataManager.deleteItem(atIndex: indexPath.row, item: favoriteArticle)
    }
}

