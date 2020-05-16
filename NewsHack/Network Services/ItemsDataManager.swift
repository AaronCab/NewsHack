//
//  ItemsDataManager.swift
//  NewsHack
//
//  Created by Aaron Cabreja on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class ItemsDataManager{
    private  static let filename = "FavoritesModel.plist"
    // create
    static public func saveToDocumentsDirectory(newFavoriteNews: FavoritesModel) -> (success: Bool, error: Error?){
        let path = FileManagerHelper.filepathToDocumentsDirectory(filename: filename)
        var favoriteNews = fetchItemsFromDocumentsDirectory()
        favoriteNews.append(newFavoriteNews)
        do {
            let data = try PropertyListEncoder().encode(favoriteNews)
            try data.write(to: path, options: Data.WritingOptions.atomic)
          print(path)
        } catch {
            print("property list decoding error: \(error)")
            return(false, nil)
        }
        return(true, nil)
    }
    
    // read
    static public func fetchItemsFromDocumentsDirectory() -> [FavoritesModel] {
        let path = FileManagerHelper.filepathToDocumentsDirectory(filename: filename).path
        var article = [FavoritesModel]()
        var items = [FavoritesModel]()
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    article = try PropertyListDecoder().decode([FavoritesModel].self, from: data)
                    items = article
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("data is nil")
            }
        }
        return items
    }
    
    // update
    public func updateItem(item: FavoritesModel, atIndex index: Int) {
        let path = FileManagerHelper.filepathToDocumentsDirectory(filename: ItemsDataManager.filename)
        var items = ItemsDataManager.fetchItemsFromDocumentsDirectory()
        items[index] = item
        do {
            let data = try PropertyListEncoder().encode(items)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list decoding error: \(error)")
        }
    }
    
    // delete
    static public func deleteItem(atIndex index: Int, item: FavoritesModel) {
        let path = FileManagerHelper.filepathToDocumentsDirectory(filename: ItemsDataManager.filename)
        var items = ItemsDataManager.fetchItemsFromDocumentsDirectory()
        items.remove(at: index)
        
        do {
            let data = try PropertyListEncoder().encode(items)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list decoding error: \(error)")
        }
    }
}
