//
//  ViewController.swift
//  Conversoes
//
//  Created by user211178 on 12/21/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ui_peso.isHidden = true
        ui_moeda.isHidden = true
        ui_altura.isHidden = true
        ui_temp.isHidden = true
        // Do any additional setup after loading the view.
    }
    //UIView
    @IBOutlet weak var ui_peso: UIView!
    @IBOutlet weak var ui_moeda: UIView!
    @IBOutlet weak var ui_altura: UIView!
    @IBOutlet weak var ui_temp: UIView!
    
    //botoes UI
    @IBAction func bt_peso(_ sender: Any) {
        ui_peso.isHidden = false
        ui_moeda.isHidden = true
        ui_altura.isHidden = true
        ui_temp.isHidden = true
    }
    
    @IBAction func bt_moedas(_ sender: Any) {
        ui_peso.isHidden = true
        ui_moeda.isHidden = false
        ui_altura.isHidden = true
        ui_temp.isHidden = true
    }
    
    @IBAction func bt_altura(_ sender: Any) {
        ui_peso.isHidden = true
        ui_moeda.isHidden = true
        ui_temp.isHidden = true
        ui_altura.isHidden = false
    }
    
    @IBAction func bt_temp(_ sender: Any) {
        ui_peso.isHidden = true
        ui_moeda.isHidden = true
        ui_altura.isHidden = true
        ui_temp.isHidden = false
    }
    
    // Peso variáveis
    @IBOutlet weak var result_peso_lb: UILabel!
    @IBOutlet weak var peso_field: UITextField!
    
    @IBAction func bt_kg_lb(_ sender: Any) {
        var kg = Float((peso_field.text?.replacingOccurrences(of: ",", with: ".") ?? "0")) ?? 0
        var result: Float = kg * 2.20462
        
        result_peso_lb.text = "\(String(format: "%.2f", result)) lbs"
    }
    
    @IBAction func bt_lb_kg(_ sender: Any) {
        var lb = Float((peso_field.text?.replacingOccurrences(of: ",", with: ".") ?? "0")) ?? 0
        var result: Float = lb * 0.453592
        
        result_peso_lb.text = "\(String(format: "%.2f", result)) kg"
    }
    //moeda variáveis
    @IBOutlet weak var result_moeda_lb: UILabel!
    @IBOutlet weak var moeda_field: UITextField!
    
    @IBAction func bt_rs_s(_ sender: Any) {
        var rs = Float((moeda_field.text?.replacingOccurrences(of: ",", with: ".") ?? "0")) ?? 0
        var result: Float = rs * 0.17
        
        result_moeda_lb.text = "$ \(String(format: "%.2f", result))"
    }
    
    @IBAction func bt_s_rs(_ sender: Any) {
        var s = Float((moeda_field.text?.replacingOccurrences(of: ",", with: ".") ?? "0")) ?? 0
        var result: Float = s * 5.75
        
        result_moeda_lb.text = "R$ \(String(format: "%.2f", result))"
    }
    //altura variaveis
    @IBOutlet weak var altura_field: UITextField!
    @IBOutlet weak var result_altura_lb: UILabel!
    
    @IBAction func bt_m_cm(_ sender: Any) {
        var m = Float((altura_field.text?.replacingOccurrences(of: ",", with: ".") ?? "0")) ?? 0
        var result: Float = m * 100
        
        result_altura_lb.text = "\(String(format: "%.2f", result) ?? "0") cm"
    }
    
    @IBAction func bt_cm_m(_ sender: Any) {
        var cm = Float((altura_field.text?.replacingOccurrences(of: ",", with: ".") ?? "0")) ?? 0
        var result: Float = cm / 100
        
        result_altura_lb.text = "\(String(format: "%.2f", result)) m"
    }
    
    //temp variavveis
    @IBOutlet weak var result_temp_lb: UILabel!
    @IBOutlet weak var temp_field: UITextField!
    
    @IBAction func bt_c_f(_ sender: Any) {
        var c = Float((temp_field.text?.replacingOccurrences(of: ",", with: ".") ?? "0")) ?? 0
        var result: Float = (c * 9 / 5) + 32
        
        result_temp_lb.text = "\(String(format: "%.2f", result)) Fº"
    }
    @IBAction func bt_f_c(_ sender: Any) {
        var f = Float((temp_field.text?.replacingOccurrences(of: ",", with: ".") ?? "0")) ?? 0
        var result: Float = (f - 32) * 5 / 9
        
        result_temp_lb.text = "\(String(format: "%.2f", result)) Cº"
    }
}
