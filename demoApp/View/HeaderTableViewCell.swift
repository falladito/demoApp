//
//  HeaderTableViewCell.swift
//  demoApp
//
//  Created by Fernando Castillo on 30/04/2018.
//  Copyright © 2018 Fernando Castillo. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headerCellImageOutlet: UIImageView!
    @IBOutlet weak var headerCellTitleOutlet: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup (with news: News) {
        
        headerCellTitleOutlet.text = news.title
        let image = news.thumbnail
        let url = URL(string: image)
        headerCellImageOutlet.kf.setImage(with: url, placeholder:#imageLiteral(resourceName: "placeholder"))
        
    }


}
