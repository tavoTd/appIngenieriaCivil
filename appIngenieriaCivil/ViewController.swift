//
// –– ViewController.swift
//  appIngenieriaCivil
//
//  Created by CEDAM05 on 20/02/20.
//  Copyright © 2020 CEDAM05. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnObtener: UIButton!
    @IBOutlet weak var btnAgregar: UIButton!
    @IBOutlet weak var btnEditar: UIButton!
    @IBOutlet weak var btnBorrar: UIButton!
    @IBOutlet weak var btnActualizar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnObtener.layer.cornerRadius = 5.0
        btnAgregar.layer.cornerRadius = 5.0
        btnEditar.layer.cornerRadius = 5.0
        btnBorrar.layer.cornerRadius = 5.0
        btnActualizar.layer.cornerRadius = 5.0
    }

    

}

