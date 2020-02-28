//
//  StudentMenuViewController.swift
//  appIngenieriaCivil
//
//  Created by CEDAM03 on 28/02/20.
//  Copyright © 2020 CEDAM05. All rights reserved.
//

import UIKit
import SafariServices

class StudentMenuViewController: UIViewController {
    
    let links: [String] = ["http://www.ingenieria.acatlan.unam.mx",
                            "http://www.escolares.acatlan.unam.mx",
                            "",
                            "",
                         "http://132.248.180.207/sail/Alumno/Login.aspx",
                           "https://www.dgae-siae.unam.mx/www_gate.php",
                            "https://www.becarios.unam.mx/Portal2018/?page_id=111",
                            "http://www.ingenieria.acatlan.unam.mx/media/vinculos/2019/08/XI%20CONCURSO%20PUENTES%20DE%20MADERA.pdf",
                            "",
                            "https://www.facebook.com/ing.civil.acatlan",
                            "https://www.instagram.com/i.c.acatlan",
                            "https://www.instagram.com/i.c.acatlan",
                            "https://www.facebook.com/ing.civil.acatlan/inbox",
                            ""]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Funcion que redirecciona a las paginas externas
    @IBAction func redirectTo(_ sender: UIButton) {
        
        print(sender.tag)
        switch sender.tag {
            
        case 0:
            showSafariVC(for: links[sender.tag])
            
        case 1:
            showSafariVC(for: links[sender.tag])
        
        case 2:
            showSafariVC(for: links[sender.tag])
            
        case 3:
            showSafariVC(for: links[sender.tag])
        
        case 4:
            showSafariVC(for: links[sender.tag])
            
        case 5:
            showSafariVC(for: links[sender.tag])
        
        case 6:
            showSafariVC(for: links[sender.tag])
            
        case 7:
            showSafariVC(for: links[sender.tag])
        
        case 8:
            showSafariVC(for: links[sender.tag])
        
        case 9:
            showSafariVC(for: links[sender.tag])
            
        case 10:
            showSafariVC(for: links[sender.tag])
        
        case 11:
            showSafariVC(for: links[sender.tag])
            
        case 12:
            showSafariVC(for: links[sender.tag])
        
        case 13:
            showSafariVC(for: links[sender.tag])
            
        default:
            print("No cargo ninguna página para mostrar")
        }
    }
    
    //Redirecciona a la pagina solicitada
    func showSafariVC(for url: String){
        
        guard let url = URL(string: url) else{
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}
