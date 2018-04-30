//
//  NewsService.swift
//  demoApp
//
//  Created by Fernando Castillo on 30/04/2018.
//  Copyright © 2018 Fernando Castillo. All rights reserved.
//

import Foundation

class NewsService {
    
    let dao = NewsDAO()
    
    func getNews(completion: @escaping ([News]) -> Void) -> Void {
        dao.getNewsFromAPI { (response) in
            completion(response)
        }
    }
    
    
    }
