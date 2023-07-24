//
//  GameScene.swift
//  calmBird
//
//  Created by salih kocatürk on 21.07.2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var bird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    override func didMove(to view: SKView) {
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        // bird
     
        bird = childNode(withName: "bird") as! SKSpriteNode
        let  birdtexture = SKTexture(imageNamed: "bird")
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdtexture.size().width / 13)
        bird.physicsBody?.affectedByGravity = true
        bird.physicsBody?.mass = 0.5
       
     
    }
        
        func touchDown(atPoint pos : CGPoint) {
            
        }
        
        func touchMoved(toPoint pos : CGPoint) {
            
        }
        
        func touchUp(atPoint pos : CGPoint) {
            
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            
        }
        
        override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
            
        }
        
        
        override func update(_ currentTime: TimeInterval) {
            // Called before each frame is rendered
        }
    }

