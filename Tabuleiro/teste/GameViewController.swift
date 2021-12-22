//
//  GameViewController.swift
//  teste
//
//  Created by user211178 on 12/16/21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Var e labels
    @IBOutlet weak var resP1: UILabel!
    @IBOutlet weak var resP2: UILabel!
    @IBOutlet weak var lbWinner: UILabel!
    var res: Int = 0
    var flag1 = 0
    var flag2 = 0
    var randomP1: Int = 0
    var randomP2: Int = 0
    @IBOutlet weak var total1: UILabel!
    @IBOutlet weak var total2: UILabel!
    var count1: Int = 0
    var count2: Int = 0

    
    // Button e images
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var res2: UIImageView!
    @IBOutlet weak var res1: UIImageView!
    
    //botoes
    
    @IBAction func playP1(_ sender: Any) {
        randomP1 = Int.random(in: 1...6)
        resP1.text = ""
        flag1 = 1
        button1.isEnabled = false
        
        switch(randomP1){
        case 1:
            res1.image = UIImage(named: "d1")
        case 2:
            res1.image = UIImage(named: "d2")
        case 3:
            res1.image = UIImage(named: "d3")
        case 4:
            res1.image = UIImage(named: "d4")
        case 5:
            res1.image = UIImage(named: "d5")
        case 6:
            res1.image = UIImage(named: "d6")
        default:
            res1.image = UIImage(named: "d1")
        }
        
        play()
    }
    
    
    @IBAction func playP2(_ sender: Any) {
        randomP2 = Int.random(in: 1...6)
        resP2.text = ""
        flag2 = 1
        button2.isEnabled = false
        
        switch(randomP2){
        case 1:
            res2.image = UIImage(named: "d1")
        case 2:
            res2.image = UIImage(named: "d2")
        case 3:
            res2.image = UIImage(named: "d3")
        case 4:
            res2.image = UIImage(named: "d4")
        case 5:
            res2.image = UIImage(named: "d5")
        case 6:
            res2.image = UIImage(named: "d6")
        default:
            res2.image = UIImage(named: "d1")
        }
        
        play()
    }
    
    
    // função play
    func play(){
        if (flag1 == 1 && flag2 == 1){
            if (randomP1 > randomP2){
                lbWinner.text = "Jogador 1"
                count1 = count1 + 1
                total1.text = "\(count1)"
                flag1 = 0
                flag2 = 0
                button1.isEnabled = true
                button2.isEnabled = true
            }
            else if (randomP2 > randomP1 ){
                lbWinner.text = "Jogador 2"
                count2 = count2 + 1
                total2.text = "\(count2)"
                flag1 = 0
                flag2 = 0
                button1.isEnabled = true
                button2.isEnabled = true
            }
            else{
                lbWinner.text = "Empate"
                flag1 = 0
                flag2 = 0
                button1.isEnabled = true
                button2.isEnabled = true
                
            }
        }
    }
    
    //resetar
    
    @IBAction func buttonRes(_ sender: Any) {
        count1 = 0
        count2 = 0
        flag1 = 0
        flag2 = 0
        randomP1 = 0
        randomP2 = 0
        total1.text = "0"
        total2.text = "0"
        button1.isEnabled = true
        button2.isEnabled = true
    }
}
