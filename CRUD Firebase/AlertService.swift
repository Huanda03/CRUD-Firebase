//
//  AlertService.swift
//  CRUD Firebase
//
//  Created by Mac2 on 13/01/21.
//

import Foundation
import UIKit

class AlertService {
    private init(){}
    static func addUser(in vc: UIViewController, completition: @escaping (User) -> Void){
        let alert = UIAlertController(title: "Agregar Usuario", message: nil, preferredStyle: .alert)
        alert.addTextField{ (nameTF) in
            nameTF.placeholder = "Nombre"
        }
        alert.addTextField{ (ageTF) in
            ageTF.placeholder = "Edad"
            ageTF.keyboardType = .numberPad
        }
        let add = UIAlertAction (title: "Agregar", style: .default){ _ in
            guard
                let name = alert.textFields?.first?.text,
                let ageString = alert.textFields?.last?.text,
                let age = Int(ageString)
                else {return}
 
            let user = User(name: name, age: age)
            completition(user)
        }
        alert.addAction(add)
        vc.present(alert, animated: true)
    }
    static func update(_ user: User, in vc: UIViewController, completition: @escaping (User) -> Void){
        let alert = UIAlertController(title: "Actualizar Usuario", message: nil, preferredStyle: .alert)
        alert.addTextField{ (ageTF) in
            ageTF.placeholder = "Edad"
            ageTF.keyboardType = .numberPad
            ageTF.text = String(user.age)
        }
        let add = UIAlertAction (title: "Actualizar \(user.name)", style: .default){ _ in
            guard
                let ageString = alert.textFields?.last?.text,
                let age = Int(ageString)
                else {return}

            var updateUser = user
            updateUser.age = age
            completition(updateUser)
        }
        alert.addAction(add)
        vc.present(alert, animated: true)
    }
    
}
