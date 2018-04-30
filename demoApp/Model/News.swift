//
//  File.swift
//  demoApp
//
//  Created by Fernando Castillo on 30/04/2018.
//  Copyright © 2018 Fernando Castillo. All rights reserved.
//

import Foundation

public class News {
    
    var title: String
    var thumbnail: String
    var description: String
    var date: String
    var url: String
    var author: String
    
    init (dictionary: [ String : AnyObject]) {
        self.title = dictionary["title"] as? String ?? "Esta nota no tiene título"
        self.thumbnail = dictionary["urlToImage"] as? String ?? "No Thumbnail"
        self.description = dictionary["description"] as? String ?? "Esta nota no tiene descripción."
        self.date = dictionary["publishedAt"] as? String ?? "No Date"
        self.url = dictionary["url"] as? String ?? "No Url"
        self.author = dictionary["author"] as? String ?? "Autor desconocido"
    }
    
}
