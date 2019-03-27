//
//  APIClient.swift
//  NewsHack
//
//  Created by Aaron Cabreja on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
final class ApiClient{
    static let key = "15aa5f619ef447b583cdff553f92edaf"

            static func getAllArticles(query: String, callBack: @escaping (AppError?, [ArticleWrapper]?) -> Void){
                
                let newsEndPoint = "https://newsapi.org/v2/everything?q=\(query)&apiKey=\(ApiClient.key)"
                NetworkHelper.shared.performDataTask(endpointURLString: newsEndPoint, httpMethod: "GET", httpBody: nil) { (appError, newsData) in
                    if let appError = appError {
                        callBack(appError, nil)
                    }
                    if let newsData = newsData {
                        do{
                            let onlineNewsData = try JSONDecoder().decode(NewsData.self, from: newsData)
                            callBack(nil, onlineNewsData.articles)
                        } catch{
                            callBack(AppError.jsonDecodingError(error), nil)
                        }
                    }
                }
                
                
            }
    
    
    static func getTopHeadlineByCountry(country: String, completionHandler: @escaping([ArticleWrapper]?, AppError?) -> Void) {
        let urlString =  "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=\(ApiClient.key)"
        NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (error, data) in
            if let error = error {
                completionHandler(nil, error)
            }
            if let data = data {
                do {
                    let newsData = try JSONDecoder().decode(NewsData.self, from: data)
                    completionHandler(newsData.articles, nil)
                } catch {
                    completionHandler(nil, AppError.jsonDecodingError(error))
                }
            }
        }
    }
    
    static func getTopHeadlineByCategory(country: String, categories: String, completionHandler: @escaping([ArticleWrapper]?, AppError?) -> Void) {
        let urlString =  "https://newsapi.org/v2/top-headlines?country=\(country)&category=\(categories)apiKey=\(ApiClient.key)"
        NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (error, data) in
            if let error = error {
                completionHandler(nil, error)
            }
            if let data = data {
                do {
                    let newsData = try JSONDecoder().decode(NewsData.self, from: data)
                    completionHandler(newsData.articles, nil)
                } catch {
                    completionHandler(nil, AppError.jsonDecodingError(error))
                }
            }
        }
    }
    
}

