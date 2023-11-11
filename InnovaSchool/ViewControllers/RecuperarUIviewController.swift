//
//  RecuperarUIviewController.swift
//  InnovaSchool
//
//  Created by DAMII on 6/11/23.
//

import UIKit

class RecuperarUIviewController: UIViewController {

    @IBOutlet weak var txtUsuario: UITextField!
    
    @IBOutlet weak var txtCorreo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    
    @IBAction func btnValidar(_ sender: UIButton) {
        
        
        guard let correo = txtCorreo.text, let user = txtUsuario.text else {
            return
        }

        if let usuario = UsuarioController().validacionrecuperar(usuario: user, correo: correo){
            
            print(correo)
            print(user)
            
            
            print("exitoso")
            performSegue(withIdentifier: "actualizarcontra", sender: nil)
            
        } else {
            print("Inicio de sesión fallido. Verifica tus credenciales.")
        }
        
        /*let user = txtUsuario.text ?? ""
        let email = txtCorreo.text ?? ""
        
        if let usuario =  UsuarioController().validacionrecuperar(usuario: user, correo: email) {
            print("EXITO")
        } else {
            print("error")
        }*/
    
    }
    
   
}
