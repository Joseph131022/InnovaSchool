//
//  IniciarUsuarioViewController.swift
//  InnovaSchool
//
//  Created by DAMII on 4/11/23.
//

import UIKit

class IniciarUsuarioViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    
    let controllerUsuario = UsuarioController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnLoguearse(_ sender: UIButton) {
        
        guard let correo = txtCorreo.text, let password = txtPassword.text else {
            return
        }

        if let usuario = controllerUsuario.iniciarSesion(correo: correo, password: password) {
            
            print(correo)
            print(password)
            
            if usuario.role == "ADMIN" {
                performSegue(withIdentifier: "inicioAdmin", sender: nil)
            } else if usuario.role == "PROFESOR" {
                performSegue(withIdentifier: "inicioProfesor", sender: nil)
            } else {
                print("Rol desconocido")
            }
            
            print("Inicio de sesión exitoso")
            print("Inicio de sesión exitoso. Rol: \(usuario.role ?? "Sin rol")")
            
        } else {
            print("Inicio de sesión fallido. Verifica tus credenciales.")
        }
        
    }
   
    
    
    @IBAction func btnRecuperar(_ sender: UIButton) {
        
        performSegue(withIdentifier: "recuperar", sender: nil)
        
    }
    
    
    
    
    
    
}
