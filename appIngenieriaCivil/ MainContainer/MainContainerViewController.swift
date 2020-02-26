//
//  MainContainerViewController.swift
//  appIngenieriaCivil
//
//  Created by CEDAM03 on 25/02/20.
//  Copyright © 2020 CEDAM05. All rights reserved.
//
import UIKit

class MainContainerViewController: UIViewController, NewsMenuDelegate {

    @IBOutlet weak var containerStudentMenu: UIView!
    @IBOutlet weak var containerNewsMenu: UIView!
    @IBOutlet weak var newsMenuConstraint: NSLayoutConstraint! //permite acceder al constraint del containerNewsMenu
    
    var newsMenu: NewsMenuViewController? //permite acceder a las propiedades de NewsMenuViewController
    var showMenu: Bool = false //permite mostrar u ocultar el menu de estudiante
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Accede a la propiedad de los viewcontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toNewsMenu"{
            newsMenu = segue.destination as? NewsMenuViewController
            newsMenu!.delegate = self //indica que este viewcontroller se hara cargo de ejecutar el protocolo
        }
    }
    
    //funcion del protocolo NewsMenuDelegate
    func moveContainerToShowStudentMenu() {
        
        showMenu = !showMenu
        
        if showMenu{
            newsMenuConstraint.constant = 300
        }else{
            newsMenuConstraint.constant = 0
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

}
