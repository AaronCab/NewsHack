//
//  NewsFeedCell.swift
//  NewsHack
//
//  Created by Aaron Cabreja on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
protocol NewsFeedCellDelegate : AnyObject{
    func didSaveArticle(cell: NewsFeedCell)
}
class NewsFeedCell: UICollectionViewCell {
    
    @IBOutlet weak var newsFeedImage: UIImageView!
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var addToFavorites: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    weak var delegate: NewsFeedCellDelegate!
    
    
    

    @IBAction func saveToFavorites(_ sender: Any) {
        delegate.didSaveArticle(cell: self)
    }

  

}
