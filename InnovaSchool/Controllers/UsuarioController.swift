//
//  UsuarioController.swift
//  InnovaSchool
//
//  Created by DAMII on 4/11/23.
//

import UIKit

class UsuarioController: NSObject {

    func ValidacionCodigo(codigo: Int) -> [UserEntity] {
        var datos: [UserEntity]!

        let delegate = UIApplication.shared.delegate as! AppDelegate
        let contextoBD = delegate.persistentContainer.viewContext

        do {
            let registros = UserEntity.fetchRequest()
            let predicate = NSPredicate(format: "codigo == %d", codigo)
            registros.predicate = predicate

            datos = try contextoBD.fetch(registros)
        } catch let ex as NSError {
            print(ex.localizedDescription)
        }

        return datos
    }
    
    func ValidacionCorreo(correo: String) -> [UserEntity] {
        var datos: [UserEntity]!

        let delegate = UIApplication.shared.delegate as! AppDelegate
        let contextoBD = delegate.persistentContainer.viewContext

        do {
            let registros = UserEntity.fetchRequest()
            let predicate = NSPredicate(format: "correo==%@", correo)
            registros.predicate = predicate

            datos = try contextoBD.fetch(registros)
        } catch let ex as NSError {
            print(ex.localizedDescription)
        }

        return datos
    }
    
    func ValidacionUsuario(correo: String, password: String) -> [UserEntity]? {
        var datos: [UserEntity]!

        let delegate = UIApplication.shared.delegate as! AppDelegate
        let contextoBD = delegate.persistentContainer.viewContext

        do {
            let registros = UserEntity.fetchRequest()
            let predicate = NSPredicate(format: "correo == %@ AND password == %@",correo,password)
            registros.predicate = predicate

            datos = try contextoBD.fetch(registros)
        } catch let ex as NSError {
            print(ex.localizedDescription)
        }

        return datos
    }
    
    
    func iniciarSesion(correo: String, password:String) -> UserEntity?{
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let contextoBD = delegate.persistentContainer.viewContext
        
        do {
            let fetchRequest = UserEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "correo == %@ AND password == %@", correo, password)
            
            let usuarios = try contextoBD.fetch(fetchRequest)
            if let usuario = usuarios.first {
                return usuario
            } else {
                return nil
            }
            
        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func validacionrecuperar(usuario: String, correo:String) -> UserEntity?{
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let contextoBD = delegate.persistentContainer.viewContext
        
        do {
            let fetchRequest = UserEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "nombres == %@ AND correo == %@", usuario, correo)
            
            let usuarios = try contextoBD.fetch(fetchRequest)
            if let usuario = usuarios.first {
                return usuario
            } else {
                return nil
            }
            
        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
    
    

    func RegistrarUsuario(bean:Usuario){
        let delegate=UIApplication.shared.delegate as!
        AppDelegate
        let contextoBD=delegate.persistentContainer.viewContext
        
        let tabla=UserEntity(context: contextoBD)
        tabla.codigo=Int16(bean.codigo)
        tabla.nombres=bean.nombres
        tabla.correo=bean.correo
        tabla.numero=Int16(bean.numero)
        tabla.password=bean.password
        tabla.role=bean.role
        do{
            try contextoBD.save()
            print("Usuario Registrado Satisfactoriamente")
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
    }
    
    /*func actualizarUsuario(bean:UserEntity){
        let delegate = UIApplication
            .shared.delegate as! AppDelegate
                
        let contextDB = delegate.persistentContainer
            .viewContext
        do{
            //PASO 6: graba
            try contextDB.save()
            print("Usuario Actualizado")
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
    }*/
    
    func actualizarContrasena(nuevaContrasena: String) -> Bool {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let contextoBD = delegate.persistentContainer.viewContext
        
        do {
            let fetchRequest = UserEntity.fetchRequest()
            
            let usuarios = try contextoBD.fetch(fetchRequest)
            for usuario in usuarios {
                // Actualiza la contraseña de cada usuario
                usuario.password = nuevaContrasena
            }
            
            // Guarda los cambios en el contexto
            try contextoBD.save()
            
            return true // Contraseñas actualizadas con éxito
        } catch let error as NSError {
            print(error.localizedDescription)
            return false // Error al actualizar las contraseñas
        }
    }


}
