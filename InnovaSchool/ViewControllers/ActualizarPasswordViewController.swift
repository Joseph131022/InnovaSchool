//
//  ActualizarPasswordViewController.swift
//  InnovaSchool
//
//  Created by DAMII on 6/11/23.
//

import UIKit

class ActualizarPasswordViewController: UIViewController {
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtRepeatPassword: UITextField!
    
    
    var bean:UserEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnActualizarPassword(_ sender: UIButton) {
        var newPass=txtNewPassword.text ?? ""
        var pass = txtRepeatPassword.text ?? ""
    
        // Verificar si las contraseñas coinciden
            if newPass == pass {
                // Contraseñas coinciden, proceder a la actualización
                if UsuarioController().actualizarContrasena(nuevaContrasena: newPass) {
                    // Contraseña actualizada con éxito
                    mostrarMensaje("Contraseña actualizada con éxito")
                } else {
                    // Error al actualizar la contraseña
                    mostrarMensaje("Error al actualizar la contraseña")
                }
            } else {
                // Contraseñas no coinciden, mostrar mensaje de error
                mostrarMensaje("Las contraseñas no coinciden")
            }

    }
    
    
    func mostrarMensaje(_ mensaje: String) {
        let alert = UIAlertController(title: "Mensaje", message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
