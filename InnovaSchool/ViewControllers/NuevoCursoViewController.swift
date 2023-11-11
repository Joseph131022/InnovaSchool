//
//  NuevoCursoViewController.swift
//  InnovaSchool
//
//  Created by DAMII on 7/11/23.
//

import UIKit

class NuevoCursoViewController: UIViewController {

    @IBOutlet weak var txtcodigo: UITextField!
    @IBOutlet weak var txtcurso: UITextField!
    @IBOutlet weak var txtprofesor: UITextField!
    
    @IBOutlet weak var txtduracion: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    
    @IBAction func btnregistrar(_ sender: UIButton) {
        let cod=Int16(txtcodigo.text ?? "0") ?? 0
        
        let cur = txtcurso.text ?? ""
        let profe = txtprofesor.text ?? ""
        let durac = txtduracion.text ?? ""
        
        let obj = Curso(idCurso: cod, nombre: cur, profesor: profe, duracion: durac)
        
        
        CursoController().RegistrarCurso(bean: obj)
        
        print("Curso registrado")
        
        
    }
    
}
