//
//  FavoritesViewController.swift
//  NewsHack
//
//  Created by Aaron Cabreja on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favoriteCollectionView.delegate = self
        self.favoriteCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavorites()
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
                    cell.favoriteImage.image = image
                }
            }
        favoriteCell.titleLabel.text = favorite.title
        favoriteCell.authorLabel.text = favorite.author
        favoriteCell.descriptionTextView.text = favorite.description
        return cell
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { alert in
            self.deleteFavorite(indexPath: indexPath)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    private func deleteFavorite(indexPath: IndexPath) {
        let favoriteArticle = favoriteNews[indexPath.row]
        ItemsDataManager.deleteItem(atIndex: indexPath.row, item: favoriteArticle)
    }
}

