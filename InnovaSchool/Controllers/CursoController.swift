//
//  CursoController.swift
//  InnovaSchool
//
//  Created by DAMII on 7/11/23.
//

import UIKit

class CursoController: NSObject {
    func RegistrarCurso(bean:Curso){
        let delegate=UIApplication.shared.delegate as!
        AppDelegate
        let contextoBD=delegate.persistentContainer.viewContext
        
        let tabla=CursoEntity(context: contextoBD)
        tabla.idCurso=Int16(bean.idCurso)
        tabla.nombre=bean.nombre
        tabla.profesor=bean.profesor
        tabla.duracion=bean.duracion
       
        do{
            try contextoBD.save()
            print("Curso registrado")
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
    }
    func listarCurso()->[CursoEntity]{
        //declarar
        var datos:[CursoEntity]!
        //PASO 1: objeto de la clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //PASO 2: acceder a la conexion de la base de datos
        let contextBD=delegate.persistentContainer.viewContext
        //PASO 3: controlar exception
        do{
            let registros=CursoEntity.fetchRequest()
            datos = try contextBD.fetch(registros)
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
        return datos
    }
    
    func Validacion(codigo: Int) -> [CursoEntity] {
        var datos: [CursoEntity]!

        let delegate = UIApplication.shared.delegate as! AppDelegate
        let contextoBD = delegate.persistentContainer.viewContext

        do {
            let registros = CursoEntity.fetchRequest()
            let predicate = NSPredicate(format: "idCurso == %d", codigo)
            registros.predicate = predicate

            datos = try contextoBD.fetch(registros)
        } catch let ex as NSError {
            print(ex.localizedDescription)
        }

        return datos
    }
    
    
    
    

}
