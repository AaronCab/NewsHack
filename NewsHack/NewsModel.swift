//
//  NewsModel.swift
//  NewsHack
//
//  Created by Aaron Cabreja on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
struct NewsData: Codable {
    let totalResults: Int
    let articles: [ArticleWrapper]?
    
}
struct ArticleWrapper: Codable {
    let source: SourceWrapper
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String?
}

struct SourceWrapper : Codable {
    let name: String
}
