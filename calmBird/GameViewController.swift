//
//  GameViewController.swift
//  calmBird
//
//  Created by salih kocatürk on 21.07.2023.
//

import UIKit
import SpriteKit
import GameplayKit
import CoreData
class GameViewController: UIViewController {
    var chosenBird = ""
    var chosenBirdId = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if chosenBirdId != 0{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
                    
        }
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsPhysics = true
        }
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
    
    @IBAction func birdsButtton(_ sender: Any) {
        performSegue(withIdentifier: "tobirds", sender: nil)
    }
    
}
