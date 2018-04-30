//
//  TableViewCell.swift
//  demoApp
//
//  Created by Fernando Castillo on 30/04/2018.
//  Copyright © 2018 Fernando Castillo. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeTableImageOutlet: UIImageView!
    @IBOutlet weak var homeTableTitleOutlet: UILabel!
    
    
    func setup (with news: News) {
        homeTableTitleOutlet.text = news.title
        homeTableTitleOutlet.sizeToFit()
        let image = news.thumbnail
        let url = URL(string: image)
        homeTableImageOutlet.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"))
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
