//
//  ViewController.swift
//  IMC
//
//  Created by user211178 on 12/16/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    
    @IBOutlet weak var viResult: UIView!
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    //botao funcional
    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(tfWeight.text!.replacingOccurrences(of: ",", with: ".")), let height = Double(tfHeight.text!.replacingOccurrences(of: ",", with: ".")){
            imc = weight / (height*height)
            showResult()
        }
    }
    
    func showResult(){
        var result: String = ""
        var image: String = ""
        
        switch imc{
        case 0..<16:
            result = "Magreza"
            image = "magreza"
        case 16..<18.5:
            result = "Abaixo do peso"
            image = "abaixo"
        case 18.5..<25:
            result = "Peso ideal"
            image = "ideal"
        case 18.5..<25:
            result = "Sobrepeso"
            image = "sobre"
        default:
            result = "Obesidade"
            image = "obesidade"
        }
        lbResult.text = "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
        view.endEditing(true)
    }

}

