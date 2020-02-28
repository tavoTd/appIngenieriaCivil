//
//  PruebaAlerta.swift
//  appIngenieriaCivil
//
//  Created by CEDAM15 on 27/02/20.
//  Copyright © 2020 CEDAM05. All rights reserved.
//

import Foundation
import UIKit

class PruebaAlerta: UIViewController {
    

    @IBOutlet weak var btnMisionTapped: UIButton!
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        
    

      
    
    // MARK: - Methods
    
        func btnMisionTapped(_ sender: Any) {
        Alert.showHelpAlert(on: self)
        }
    }
}
