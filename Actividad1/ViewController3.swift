//
//  ViewController3.swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var txtValidaUser: UITextField!
    @IBOutlet weak var lblErrorRcu: UILabel!
    var usuariorcu : String?
    var contraseñarcu : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if txtValidaUser.text == nil || txtValidaUser.text == "" {
            lblErrorRcu.text = "Ingrese su usuario"
            return false
        }
        else if txtValidaUser.text == usuariorcu{
            print("Tu contraseña es: \(String(describing: contraseñarcu))")
        }else{
            lblErrorRcu.text = "Usuario Incorrecto"
            return false
        }
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
