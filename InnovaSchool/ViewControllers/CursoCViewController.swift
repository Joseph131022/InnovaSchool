//
//  CursoCViewController.swift
//  InnovaSchool
//
//  Created by DAMII on 7/11/23.
//

import UIKit

class CursoCViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    
    @IBOutlet weak var tvCursos: UITableView!
    
    var listCursos:[CursoEntity]=[]
    var pos = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listCursos=CursoController().listarCurso()
        //enviar origen de datos al atributo tvClientes
        tvCursos.dataSource = self
        //
        tvCursos.delegate = self
        //alto de la celda
        tvCursos.rowHeight=150
    }
    

  
    @IBAction func btnnuevocurs(_ sender: UIButton) {
        
        performSegue(withIdentifier: "nuevocurso", sender: nil)
        
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            listCursos.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            

            
            let row = tvCursos.dequeueReusableCell(withIdentifier: "listCursos") as! ItemCursoTableViewCell
            
            row.lblCurso.text=listCursos[indexPath.row].nombre
            row.lblProfesor.text=listCursos[indexPath.row].profesor
            row.lblDuracion.text=listCursos[indexPath.row].duracion
            
            return row
        }
        
    
    
}
