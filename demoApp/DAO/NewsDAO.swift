//
//  NewsDAO.swift
//  demoApp
//
//  Created by Fernando Castillo on 30/04/2018.
//  Copyright © 2018 Fernando Castillo. All rights reserved.
//

import Foundation
import Alamofire

class NewsDAO {

func getNewsFromAPI(completion: @escaping ([News]) -> Void ) -> Void {
    
    Alamofire
        .request("https://newsapi.org/v2/top-headlines?country=ar&category=technology&apiKey=18836281f33f4e8fa82ab2e647e7ece0")
        .responseJSON { (response) in
            if let json = response.result.value as? [ String : AnyObject ] {
                
                print(response)
                
                if let news = json["articles"] as? [[String : AnyObject]] {
                    var arrayNews: [News] = []
                    
                    for aNew in news {
                        let newNews = News(dictionary: aNew)
                        if newNews.thumbnail == "No Thumbnail" {
                            print("NO")
                        } else {
                        arrayNews.append(newNews)
                        }
                    }
                    
                    completion(arrayNews)
                }
            }
    }
}

}
