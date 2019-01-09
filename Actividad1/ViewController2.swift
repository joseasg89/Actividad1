//
//  ViewController2.swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var txtNombre: UITextField!
    @IBAction func txtNombreChang(_ sender: Any) {
        if txtNombre.text?.isEmpty == true{
            lblNombre.text = "El campo es Obligatorio"
            validador = false
        }else{
            lblNombre.text = ""
        }
    }
    @IBOutlet weak var lblNumEmp: UILabel!
    @IBOutlet weak var txtNumEmp: UITextField!
    @IBAction func txtNumEmpChang(_ sender: Any) {
        if txtNumEmp.text?.isEmpty == true{
            lblNumEmp.text = "El campo es Obligatorio"
            validador = false
        }else{
            lblNumEmp.text = ""
        }
    }
    @IBOutlet weak var lblTelefono: UILabel!
    @IBOutlet weak var txtTelefono: UITextField!
    @IBAction func txtTelefonoChang(_ sender: Any) {
        let isnumber: Bool = isTelefon(string: txtTelefono.text!)
        if txtTelefono.text!.count > 10{
            lblTelefono.text = "El limete es de 10 numeros"
            validador = false
        }else if !isnumber{
            if txtTelefono.text! != ""{
                lblTelefono.text = "El campo debe ser numerico"
                validador = false
            }
        }else{
            lblTelefono.text = ""
        }
    }
    @IBOutlet weak var lblFechNac: UILabel!
    @IBOutlet weak var txtFechaNac: UITextField!
    @IBAction func txtFechNacChang(_ sender: Any) {
        if txtFechaNac.text?.isEmpty == true{
            lblFechNac.text = "El campo es Obligatorio"
            validador = false
        }
        else if !isdate(string: txtFechaNac.text!){
            lblFechNac.text = "El formato es invalido"
            validador = false
        }
        else{
            lblFechNac.text = ""
        }
    }
    @IBOutlet weak var lblCorreo: UILabel!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBAction func txtCorreoChang(_ sender: Any) {
        if txtCorreo.text?.isEmpty == true{
            lblCorreo.text = "El campo es Obligatorio"
            validador = false
        }else if !isEmail(string: txtCorreo.text!){
            lblCorreo.text = "Ingrese un correo valido"
            validador = false
        }
        else{
            lblCorreo.text = ""
        }
    }
    @IBOutlet weak var lblContraseña: UILabel!
    @IBOutlet weak var txtContraseña: UITextField!
    @IBAction func txtContraseñaChang(_ sender: Any) {
        if txtContraseña.text?.isEmpty == true{
            lblContraseña.text = "El campo es Obligatorio"
            validador = false
        }else{
            lblContraseña.text = ""
        }
    }
    @IBOutlet weak var lblConfContraseña: UILabel!
    @IBOutlet weak var txtConContraseña: UITextField!
    @IBAction func txtConContraseñaChang(_ sender: Any) {
        if txtConContraseña.text?.isEmpty == true{
            lblConfContraseña.text = "El campo es Obligatorio"
            validador = false
        }else if txtConContraseña.text! != txtContraseña.text! {
            lblConfContraseña.text = "Las contraseñas son distintas"
            validador = false
        }else{
            lblConfContraseña.text = ""
        }
    }
    @IBOutlet weak var lblFaltanCampos: UILabel!
    @IBAction func btnGuardar(_ sender: Any) {
        validador = true
        txtNombreChang(txtNombre)
        txtNumEmpChang(txtNumEmp)
        txtTelefonoChang(txtTelefono)
        txtFechNacChang(txtFechaNac)
        txtCorreoChang(txtCorreo)
        txtContraseñaChang(txtContraseña)
        txtConContraseñaChang(txtConContraseña)
    }
    var validador : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vcd = segue.destination as? ViewController {
            vcd.usuario = txtCorreo.text!
            vcd.contraseña = txtConContraseña.text!
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if validador == true {
            return true
        }
        else{
            lblFaltanCampos.text = "Informacion faltante"
            return false
        }
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
func isdate(string: String) -> Bool {
    let telReg = "([0-2][0-9]|(3)[0-1])(\\/)(((0)[0-9])|((1)[0-2]))(\\/)\\d{4}"
    let telTest = NSPredicate(format:"SELF MATCHES %@", telReg)
    let result = telTest.evaluate(with: string)
    return result
}

func isEmail(string: String) -> Bool {
    let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailReg)
    let result = emailTest.evaluate(with: string)
    return result
}
func isTelefon(string: String) -> Bool {
    let telReg = "[0-9]{1,10}"
    let telTest = NSPredicate(format:"SELF MATCHES %@", telReg)
    let result = telTest.evaluate(with: string)
    return result
}
