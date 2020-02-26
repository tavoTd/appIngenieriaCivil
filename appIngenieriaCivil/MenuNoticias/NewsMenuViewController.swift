//
//  NewsMenuViewController.swift
//  appIngenieriaCivil
//
//  Created by CEDAM05 on 24/02/20.
//  Copyright © 2020 CEDAM05. All rights reserved.
//
import UIKit

protocol NewsMenuViewControllerDelegate{
    func showStundetMenu(_ showMenu: Bool)
}

class NewsMenuViewController: UIViewController {
    
    // MARK: - Propiedades
    var delegate: NewsMenuViewControllerDelegate?
    var showMenu: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation
    */

    @IBAction func btnMenuTapped(_ sender: Any) {
        showMenu = !showMenu
        delegate?.showStundetMenu(showMenu)
    }
}
