//
//  SignInViewController.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/02/20.
//  Copyright © 2020 Iván Martínez. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    // MARK: - Elementos de UI
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var vista: UIView!
    @IBOutlet weak var btnInfo: UIButton!
    @IBOutlet weak var btnHelp: UIButton!
    @IBOutlet weak var btnInicioSesion: UIButton!
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        configureElements()
    }
    //MARK: - Vista
    func configureElements(){
        btnInfo.layer.cornerRadius = 20.0
            btnHelp.layer.cornerRadius = 20.0
        
        btnInicioSesion.layer.cornerRadius = 5.0
            
            //Agrega la imagen de fondo.
            let wallpaper = UIImageView(frame: UIScreen.main.bounds)
            wallpaper.image = UIImage(named: "piedra")
            self.view.insertSubview(wallpaper, at: 0)
            
            //Redondea esquinas vista
            vista.layer.cornerRadius = 10.0
        }

      
    
    // MARK: - Methods
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
            let email = emailTextField.text
            let password = passwordTextField.text
                   
            if let email = email, let password = password {
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    }else if let result = result {
                        let user = result.user
                        
                        if user.isEmailVerified{
                            self.performSegue(withIdentifier: "ShowApp", sender: nil)
                        } else{
                            user.sendEmailVerification { (error) in
                                if let error = error {
                                    print (error.localizedDescription)
                                } else {
                            let alert = UIAlertController(title: "Verifica tu cuenta", message: "Por favor, verifica tu correo electrónico", preferredStyle: .alert)
                            
                            let okAction = UIAlertAction(title:"Ok",style: .default, handler: nil)
                            
                            alert.addAction(okAction)
                            
                            self.present(alert, animated: true, completion: nil)
                                    
                                    
                            }
                          }
                       }
                    }
                }
            }
        }
    @IBAction func btnHelpTapped(_ sender: Any) {
        Alert.showHelpAlert(on: self)
    }
}
