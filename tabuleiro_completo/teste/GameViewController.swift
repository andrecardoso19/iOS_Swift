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
    
    //botoes 
    
    @IBAction func playP1(_ sender: Any) {
        randomP1 = Int.random(in: 1...6)
        resP1.text = ""
        flag1 = 1
        count1 = count1 + randomP1
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
        count2 = count2 + randomP2
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
    
    // imagens tabuleiro 0-21
    @IBOutlet weak var p1pos0: UIImageView!
    @IBOutlet weak var p1pos1: UIImageView!
    @IBOutlet weak var p1pos2: UIImageView!
    @IBOutlet weak var p1pos3: UIImageView!
    @IBOutlet weak var p1pos15: UIImageView!
    @IBOutlet weak var p1pos14: UIImageView!
    @IBOutlet weak var p1pos12: UIImageView!
    @IBOutlet weak var p1pos11: UIImageView!
    @IBOutlet weak var p1pos10: UIImageView!
    @IBOutlet weak var p1pos9: UIImageView!
    @IBOutlet weak var p1pos8: UIImageView!
    @IBOutlet weak var p1pos4: UIImageView!
    @IBOutlet weak var p1pos21: UIImageView!
    @IBOutlet weak var p1pos20: UIImageView!
    @IBOutlet weak var p1pos19: UIImageView!
    @IBOutlet weak var p1pos18: UIImageView!
    @IBOutlet weak var p1pos17: UIImageView!
    @IBOutlet weak var p1pos16: UIImageView!
    @IBOutlet weak var p1pos13: UIImageView!
    @IBOutlet weak var p1pos5: UIImageView!
    @IBOutlet weak var p1pos6: UIImageView!
    @IBOutlet weak var p1pos7: UIImageView!
    @IBOutlet weak var p2pos19: UIImageView!
    @IBOutlet weak var p2pos21: UIImageView!
    @IBOutlet weak var p2pos20: UIImageView!
    @IBOutlet weak var p2pos18: UIImageView!
    @IBOutlet weak var p2pos17: UIImageView!
    @IBOutlet weak var p2pos16: UIImageView!
    @IBOutlet weak var p2pos15: UIImageView!
    @IBOutlet weak var p2pos14: UIImageView!
    @IBOutlet weak var p2pos13: UIImageView!
    @IBOutlet weak var p2pos12: UIImageView!
    @IBOutlet weak var p2pos11: UIImageView!
    @IBOutlet weak var p2pos10: UIImageView!
    @IBOutlet weak var p2pos9: UIImageView!
    @IBOutlet weak var p2pos8: UIImageView!
    @IBOutlet weak var p2pos7: UIImageView!
    @IBOutlet weak var p2pos6: UIImageView!
    @IBOutlet weak var p2pos5: UIImageView!
    @IBOutlet weak var p2pos4: UIImageView!
    @IBOutlet weak var p2pos3: UIImageView!
    @IBOutlet weak var p2pos0: UIImageView!
    @IBOutlet weak var p2pos1: UIImageView!
    
    @IBOutlet weak var p2pos2: UIImageView!
    
    
    // função play
    func play(){
        if (flag1 == 1 && flag2 == 1){
            button2.isEnabled = true
            button1.isEnabled = true
            flag1 = 0
            flag2 = 0
        }
        // if do peao 1
                if (count1 == 0){
                    p1pos0.image = UIImage(named: "peao1")
                }
                else if (count1 == 1){
                    p1pos1.image = UIImage(named: "peao1")
                    
                    p1pos0.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 2){
                    p1pos2.image = UIImage(named: "peao1")
                    
                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 3){
                    p1pos3.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                    
                }
                else if (count1 == 4){
                    p1pos4.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 5){
                    p1pos5.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 6){
                    p1pos6.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 7){
                    p1pos7.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 8){
                    p1pos8.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 9){
                    p1pos9.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 10){
                    p1pos10.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 11){
                    p1pos11.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 12){
                    p1pos12.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 13){
                    p1pos13.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 14){
                    p1pos14.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 15){
                    p1pos15.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 16){
                    p1pos16.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 17){
                    p1pos17.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 18){
                    p1pos18.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 19){
                    p1pos19.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else if (count1 == 20){
                    p1pos20.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos21.image = UIImage(named: "none")
                }
                else{
                    p1pos21.image = UIImage(named: "peao1")

                    p1pos0.image = UIImage(named: "none")
                    p1pos1.image = UIImage(named: "none")
                    p1pos2.image = UIImage(named: "none")
                    p1pos3.image = UIImage(named: "none")
                    p1pos5.image = UIImage(named: "none")
                    p1pos6.image = UIImage(named: "none")
                    p1pos7.image = UIImage(named: "none")
                    p1pos8.image = UIImage(named: "none")
                    p1pos9.image = UIImage(named: "none")
                    p1pos10.image = UIImage(named: "none")
                    p1pos4.image = UIImage(named: "none")
                    p1pos11.image = UIImage(named: "none")
                    p1pos12.image = UIImage(named: "none")
                    p1pos13.image = UIImage(named: "none")
                    p1pos14.image = UIImage(named: "none")
                    p1pos15.image = UIImage(named: "none")
                    p1pos16.image = UIImage(named: "none")
                    p1pos17.image = UIImage(named: "none")
                    p1pos18.image = UIImage(named: "none")
                    p1pos19.image = UIImage(named: "none")
                    p1pos20.image = UIImage(named: "none")
                    lbWinner.text = "Jogador 1"
                    button1.isEnabled = false
                    button2.isEnabled = false
                }
                
        // if do peao 2
                        if (count2 == 0){
                            p2pos0.image = UIImage(named: "peao2")
                            
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 1){
                            p2pos1.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 2){
                            p2pos2.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 3){
                            p2pos3.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 4){
                            p2pos4.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 5){
                            p2pos5.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 6){
                            p2pos6.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 7){
                            p2pos7.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 8){
                            p2pos8.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 9){
                            p2pos9.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 10){
                            p2pos10.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 11){
                            p2pos11.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 12){
                            p2pos12.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 13){
                            p2pos13.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 14){
                            p2pos14.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 15){
                            p2pos15.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 16){
                            p2pos16.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 17){
                            p2pos17.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 18){
                            p2pos18.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 19){
                            p2pos19.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else if (count2 == 20){
                            p2pos20.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos21.image = UIImage(named: "none")
                        }
                        else{
                            p2pos21.image = UIImage(named: "peao2")

                            p2pos0.image = UIImage(named: "none")
                            p2pos1.image = UIImage(named: "none")
                            p2pos2.image = UIImage(named: "none")
                            p2pos3.image = UIImage(named: "none")
                            p2pos5.image = UIImage(named: "none")
                            p2pos4.image = UIImage(named: "none")
                            p2pos6.image = UIImage(named: "none")
                            p2pos7.image = UIImage(named: "none")
                            p2pos8.image = UIImage(named: "none")
                            p2pos9.image = UIImage(named: "none")
                            p2pos10.image = UIImage(named: "none")
                            p2pos11.image = UIImage(named: "none")
                            p2pos12.image = UIImage(named: "none")
                            p2pos13.image = UIImage(named: "none")
                            p2pos14.image = UIImage(named: "none")
                            p2pos15.image = UIImage(named: "none")
                            p2pos16.image = UIImage(named: "none")
                            p2pos17.image = UIImage(named: "none")
                            p2pos18.image = UIImage(named: "none")
                            p2pos19.image = UIImage(named: "none")
                            p2pos20.image = UIImage(named: "none")
                            lbWinner.text = "Jogador 2"
                            button1.isEnabled = false
                            button2.isEnabled = false
                        }




        
    }
    
    //resetar
    
    @IBAction func buttonRes(_ sender: Any) {
        button1.isEnabled = true
        button2.isEnabled = true
        count1 = 0
        count2 = 0
        resP1.text = "Jogue"
        resP2.text = "Jogue"
        
        p1pos0.image = UIImage(named: "peao1")
        p1pos1.image = UIImage(named: "none")
        p1pos2.image = UIImage(named: "none")
        p1pos3.image = UIImage(named: "none")
        p1pos5.image = UIImage(named: "none")
        p1pos6.image = UIImage(named: "none")
        p1pos7.image = UIImage(named: "none")
        p1pos8.image = UIImage(named: "none")
        p1pos9.image = UIImage(named: "none")
        p1pos10.image = UIImage(named: "none")
        p1pos11.image = UIImage(named: "none")
        p1pos12.image = UIImage(named: "none")
        p1pos13.image = UIImage(named: "none")
        p1pos14.image = UIImage(named: "none")
        p1pos15.image = UIImage(named: "none")
        p1pos16.image = UIImage(named: "none")
        p1pos17.image = UIImage(named: "none")
        p1pos18.image = UIImage(named: "none")
        p1pos19.image = UIImage(named: "none")
        p1pos20.image = UIImage(named: "none")
        p1pos21.image = UIImage(named: "none")
        
        p2pos0.image = UIImage(named: "peao2")
        p2pos1.image = UIImage(named: "none")
        p2pos2.image = UIImage(named: "none")
        p2pos3.image = UIImage(named: "none")
        p2pos5.image = UIImage(named: "none")
        p2pos6.image = UIImage(named: "none")
        p2pos7.image = UIImage(named: "none")
        p2pos8.image = UIImage(named: "none")
        p2pos9.image = UIImage(named: "none")
        p2pos10.image = UIImage(named: "none")
        p2pos11.image = UIImage(named: "none")
        p2pos12.image = UIImage(named: "none")
        p2pos13.image = UIImage(named: "none")
        p2pos14.image = UIImage(named: "none")
        p2pos15.image = UIImage(named: "none")
        p2pos16.image = UIImage(named: "none")
        p2pos17.image = UIImage(named: "none")
        p2pos18.image = UIImage(named: "none")
        p2pos19.image = UIImage(named: "none")
        p2pos20.image = UIImage(named: "none")
        p2pos21.image = UIImage(named: "none")
        
    }
}

