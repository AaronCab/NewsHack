//
//  FavoritesModel.swift
//  NewsHack
//
//  Created by Aaron Cabreja on 3/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct FavoritesModel: Codable {
    let title: String
    let author: String
    let imageURL: URL
    let description: String
}
