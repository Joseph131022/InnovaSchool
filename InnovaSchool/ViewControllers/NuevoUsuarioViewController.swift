//
//  NuevoUsuarioViewController.swift
//  InnovaSchool
//
//  Created by DAMII on 4/11/23.
//

import UIKit
import DropDown
import Toaster
import Alamofire

class NuevoUsuarioViewController: UIViewController {

    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtNumero: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtNombres: UITextField!
    
    
    var dropdown = DropDown()
    let arrayRoles = ["ADMIN","PROFESOR"]
    var rol = ""
    
    
    var viewController: ViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func btnRegistrarU(_ sender: UIButton) {
        let cod=Int(txtCodigo.text ?? "0") ?? 0
        let nom=txtNombres.text ?? ""
        let correo=txtCorreo.text ?? ""
        let num=Int(txtNumero.text ?? "0") ?? 0
        let pass=txtPassword.text ?? ""
        let role = rol
        
        let valiCodi = UsuarioController().ValidacionCodigo(codigo: cod)
        let valiCorreo = UsuarioController().ValidacionCorreo(correo: correo)
        
        if !valiCodi.isEmpty
        {
            showAlert(mensaje: "El código \(cod) ya está registrado.")
        }
        else if nom.isEmpty,correo.isEmpty,num==0{
            showAlert(mensaje: "Completar todo el formulario de manera correcta.")
        }
        let obj=Usuario(codigo: cod, nombres: nom, correo: correo, numero: num, password: pass, role: role)
        UsuarioController().RegistrarUsuario(bean: obj)
        viewController?.navigationController?.popViewController(animated: true)
        
        
        print(role)
    }
    
    
    func showAlert(mensaje: String){
        let alerta = UIAlertController(title: "Advertencia", message: mensaje, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alerta.addAction(okAction)
        present(alerta, animated: true, completion: nil)
    }
  
    @IBAction func dropdown(_ sender: UIButton) {
        
        dropdown.dataSource = arrayRoles
        dropdown.anchorView=sender
        
        /*dropdowm.anchorView=sender*/
        dropdown.bottomOffset = CGPoint(x: 0, y:(dropdown.anchorView?.plainView.bounds.height)!)
        dropdown.show()
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            //print("Selected item: \(item) at index: \(index)")
            sender.setTitle(item, for: .normal)
            
            if index==0{
                rol="ADMIN"
            } else if index == 1 {
                rol="PROFESOR"
            }else{
                Toast(text: "Seleccione un rol").show()
            }
            
        }
    }
    
}
