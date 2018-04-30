//
//  HomeTableViewController.swift
//  demoApp
//
//  Created by Fernando Castillo on 30/04/2018.
//  Copyright © 2018 Fernando Castillo. All rights reserved.
//

import UIKit
import SVProgressHUD
import Toast_Swift
import RevealingSplashView

class HomeTableViewController: UITableViewController {
    
    var news: [News] = []
    var refresher: UIRefreshControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        getNews()
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Deslizar para actualizar")
        refresher.addTarget(self, action: #selector(HomeTableViewController.getNews), for: UIControlEvents.valueChanged)
        tableView.addSubview(refresher)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath)
            
            if let customCell = cell as? HeaderTableViewCell {
                let theNew = news[indexPath.row]
                customCell.setup(with: theNew)
            }
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath)
            
            if let customCell = cell as? HomeTableViewCell {
                let theNew = news[indexPath.row]
                customCell.setup(with: theNew)
            }
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 340.0
        } else {
            return 100.0
        }
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    @objc private func getNews() -> Void {
        let service = NewsService()
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
        SVProgressHUD.setGraceTimeInterval(0.8)
        SVProgressHUD.show(withStatus: "Cargando...")
        service.getNews { (response) in
            self.news = response
            self.tableView.reloadData()
            self.refresher.endRefreshing()
            SVProgressHUD.dismiss()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let new = news[indexPath.row]
        let destiny = storyboard?.instantiateViewController(withIdentifier: "newsDetail")
        
        if let finalDestiny = destiny as? NewsDetailViewController {
            finalDestiny.aNew = new
            self.navigationController?.show(finalDestiny, sender: nil)
        }
        
    }

}
