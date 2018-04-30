//
//  NewsDetailViewController.swift
//  demoApp
//
//  Created by Fernando Castillo on 30/04/2018.
//  Copyright © 2018 Fernando Castillo. All rights reserved.
//

import UIKit
import Kingfisher
import Toast_Swift
import SafariServices


class NewsDetailViewController: UIViewController {

    var aNew: News?

    @IBOutlet weak var newsDetrailImageOutlet: UIImageView!
    @IBOutlet weak var newsDetailDateOutlet: UILabel!
    @IBOutlet weak var newsDetailDescriptionOutlet: UITextView!
    @IBOutlet weak var newsDetailTitleOutlet: UILabel!
    @IBOutlet weak var newsDetailAuthorOutlet: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.darkText

        if let new = aNew {
            setup(with: new)
        } else {
            print("Error al instanciar el detalle")
        }

    }
    
    func setup(with: News) {
        if let image = aNew?.thumbnail {
            let url = URL(string: image)
            newsDetrailImageOutlet.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"))
        }
        newsDetailTitleOutlet.text = aNew?.title
        newsDetailDescriptionOutlet.text = aNew?.description
        newsDetailAuthorOutlet.text = aNew?.author
        if let theDate = aNew?.date {
            newsDetailDateOutlet.text = formatDate(date: theDate)
        }
    }
    
    public func formatDate(date: String) -> String {
        var myString: String
        myString = date
        var mes = myString.prefix(7)
        mes = mes.suffix(2)
        var dia = myString.prefix(10)
        dia = dia.suffix(2)
        let anio = myString.prefix(4)
        
        return "\(dia)-\(mes)-\(anio)"
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: ["Mirá esta noticia que vi en iHelper!"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)

    }
    
    @IBAction func openURLTappedButton(_ sender: Any) {
        
        if let newURL = aNew?.url {
            let svc = SFSafariViewController(url: NSURL(string: newURL)! as URL)
            self.present(svc, animated: true, completion: nil)
        } else {
            print ("Error al obtener URL")
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
