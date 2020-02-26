//
//  NewsCell.swift
//  appIngenieriaCivil
//
//  Created by CEDAM03 on 25/02/20.
//  Copyright © 2020 CEDAM05. All rights reserved.
//

import UIKit

protocol NewsCellDelegate{
    
    func didTapTitleNews(url: String)
    func didTapShareNews(url: String)
}

class NewsCell: UITableViewCell {

    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var btnShareNew: UIButton!
    @IBOutlet weak var btnTitleNew: UIButton!
    
    var delegate: NewsCellDelegate?
    var receivedNews: NewsContent!
    
    
    func sendNews(_ news: NewsContent){
        receivedNews = news 
    }
    
    @IBAction func btnTitleNewsTapped(_ sender: Any) {
        delegate?.didTapTitleNews(url: receivedNews.link)
    }
    @IBAction func btnShareNewsTapped(_ sender: Any) {
        delegate?.didTapShareNews(url: receivedNews.link)
    }

}
