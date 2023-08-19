//
//  GameScene.swift
//  calmBird
//
//  Created by salih kocatürk on 21.07.2023.
//

import SpriteKit
import GameplayKit
import CoreData
class GameScene: SKScene,SKPhysicsContactDelegate {
    var score = 0
    var chosenBird = ""
    var chosenBirdId = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var scoreLabel = SKLabelNode()
    var bird2 = SKSpriteNode()
    var box1 = SKSpriteNode()
    var slingShot = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    var gameEnded = false
    var originalPosition : CGPoint?
    var specc = 0
    var birdsPosition:CGPoint?
    var box1Position:CGPoint?
    var box2Position:CGPoint?
    var box3Position:CGPoint?
    var box4Position:CGPoint?
    var box5Position:CGPoint?
    var gamestarted = false
    var firstTimeGetBoxLocation = 0
    enum ColliderType: UInt32 {
        case Bird = 1
        case Box = 2
    }
    override func didMove(to view: SKView) {
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        // bird
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BirdIDS")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            for result in results  as! [NSManagedObject]{
                if results.count > 0 {
                    if let birdIDD = result.value(forKey: "birdId") as? Int{
                        if birdIDD == 1 {
                            specc = 1
                            
                        }
                        else if birdIDD == 2{
                            specc = 2
                        }
                        else if birdIDD == 3{
                            specc = 3
                        }
                        else
                        {
                            specc = 31
                        }
                    }
                    
                }
            }
            
            
        }catch{
            print("error")
        }
        if specc != 31 {
            //x =-176,814 y = -52,82 w = 44 h = 44
            if specc == 1 {
                let texture = SKTexture(imageNamed: "bird")
                bird2 = SKSpriteNode(texture: texture)
                bird2.position = CGPoint(x: -176.814, y: -52.82)
                originalPosition = CGPoint(x: -176.814, y: -52.82)
                bird2.size = CGSize(width: 44, height: 44)
                bird2.physicsBody = SKPhysicsBody(circleOfRadius: texture.size().width / 30)
                
                bird2.physicsBody?.affectedByGravity = false
                bird2.zPosition = 1.0
                bird2.physicsBody?.isDynamic = true
                bird2.physicsBody?.mass = 0.5
                
                birdsPosition = bird2.position
                bird2.physicsBody?.contactTestBitMask = ColliderType.Bird.rawValue
                bird2.physicsBody?.categoryBitMask = ColliderType.Bird.rawValue
                bird2.physicsBody?.collisionBitMask = ColliderType.Box.rawValue
                self.addChild(bird2)
            }
            if specc == 2 {
                let  texture = SKTexture(imageNamed: "bird1")
                bird2 = SKSpriteNode(texture: texture)
                bird2.position = CGPoint(x: -176.814, y: -52.82)
                bird2.size = CGSize(width: 44, height: 44)
                bird2.physicsBody = SKPhysicsBody(circleOfRadius: texture.size().width / 30)
                bird2.physicsBody?.affectedByGravity = false
                bird2.zPosition = 1.0
                bird2.physicsBody?.isDynamic = true
                bird2.physicsBody?.mass = 0.5
                originalPosition = bird2.position
                bird2.physicsBody?.contactTestBitMask = ColliderType.Bird.rawValue
                bird2.physicsBody?.categoryBitMask = ColliderType.Bird.rawValue
                bird2.physicsBody?.collisionBitMask = ColliderType.Box.rawValue

                birdsPosition = bird2.position
                
                self.addChild(bird2)
            }
            if specc == 3 {
                let texture = SKTexture(imageNamed: "bird2")
                bird2 = SKSpriteNode(texture: texture)
                bird2.position = CGPoint(x: -176.814, y: -52.82)
                bird2.size = CGSize(width: 44, height: 44)
                bird2.physicsBody = SKPhysicsBody(circleOfRadius: texture.size().width / 40)
                bird2.physicsBody?.affectedByGravity = false
                bird2.zPosition = 1.0
                bird2.physicsBody?.isDynamic = true
                bird2.physicsBody?.mass = 0.5
                originalPosition = bird2.position
                bird2.physicsBody?.contactTestBitMask = ColliderType.Bird.rawValue
                bird2.physicsBody?.categoryBitMask = ColliderType.Bird.rawValue
                bird2.physicsBody?.collisionBitMask = ColliderType.Box.rawValue
                birdsPosition = bird2.position
                
                self.addChild(bird2)
            }
            
        }
        
        
        //bricks
        let boxtexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: boxtexture.size().width / 12, height: boxtexture.size().height / 12)
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.mass = 0.4
        box1.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        box1.zPosition = 1
        slingShot = childNode(withName: "slingShot") as! SKSpriteNode
        slingShot.zPosition = 1
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.mass = 0.4
        box2.zPosition = 1
        
        box2.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.mass = 0.4
        box3.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        box3.zPosition = 1
        
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.mass = 0.4
        box4.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        box4.zPosition = 1
        
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.mass = 0.4
        box5.zPosition = 1
        box5.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        //label
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 4)
        scoreLabel.zPosition = 2
        if firstTimeGetBoxLocation == 0{
            box1Position = box1.position
            box2Position = box2.position
            box3Position = box3.position
            box4Position = box4.position
            box5Position = box5.position
           

            
        }
        self.addChild(scoreLabel)
        
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gamestarted == false {
            box1.physicsBody?.isDynamic = true
            box2.physicsBody?.isDynamic = true
            box3.physicsBody?.isDynamic = true
            box4.physicsBody?.isDynamic = true
            box5.physicsBody?.isDynamic = true
                        
            box1.physicsBody?.allowsRotation = true
            box2.physicsBody?.allowsRotation = true
            box3.physicsBody?.allowsRotation = true
            box4.physicsBody?.allowsRotation = true
            box5.physicsBody?.allowsRotation = true

            if let touch = touches.first{
                
                let touchLocation = touch.location(in:self)
                let touchNodes = nodes(at: touchLocation)//değdiğimiz lokasyondaki nodelar bird nodeuna eşitse....
                if touchNodes.isEmpty == false{
                    
                    
                    
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode{
                            if sprite == bird2{
                                bird2.position = touchLocation
                                                            }
                            
                        }
                    }
                }
                
            }
        }
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
   
            if contact.bodyA.collisionBitMask == ColliderType.Bird.rawValue || contact.bodyB.collisionBitMask == ColliderType.Bird.rawValue {
                
                score += 1
                scoreLabel.text = String(score)
                
            }
            
        }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gamestarted == false {
            if let touch = touches.first{
                
                let touchLocation = touch.location(in:self)
                let touchNodes = nodes(at: touchLocation)//değdiğimiz lokasyondaki nodelar bird nodeuna eşitse....
                if touchNodes.isEmpty == false{
                    
                    
                    
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode{
                            if sprite == bird2{
                                bird2.position = touchLocation
                            }
                            
                        }
                    }
                }
                
            }
        }
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gamestarted == false {
            if let touch = touches.first{
                
                let touchLocation = touch.location(in:self)
                let touchNodes = nodes(at: touchLocation)//değdiğimiz lokasyondaki nodelar bird nodeuna eşitse....
                if touchNodes.isEmpty == false{
                    
                    
                    
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode{
                            if sprite == bird2{
                                let dx = -(touchLocation.x - originalPosition!.x)
                                let dy = -(touchLocation.y - originalPosition!.y)
                                
                                let impulse = CGVector(dx: 5*dx, dy: 5*dy)
                                
                                bird2.physicsBody?.applyImpulse(impulse)
                                bird2.physicsBody?.affectedByGravity = true
                                firstTimeGetBoxLocation += 1
                                gamestarted = true
                            }
                            
                        }
                    }
                }
                
            }
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        // Called before each frame is rendered
        //reset the game
        if let birdPhysicsBody = bird2.physicsBody {
            if birdPhysicsBody.velocity.dx < 0.1 && birdPhysicsBody.velocity.dy < 0.1 && birdPhysicsBody.angularVelocity < 0.1 && gamestarted == true {
                score = 0
                scoreLabel.text = String(score)
                bird2.physicsBody?.affectedByGravity = false
                bird2.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird2.zPosition = 1
                box1.physicsBody?.isDynamic = false
                box1.zRotation = CGFloat()
                box2.physicsBody?.isDynamic = false
                box3.physicsBody?.isDynamic = false
                box4.physicsBody?.isDynamic = false
                box5.physicsBody?.isDynamic = false
                box1.physicsBody?.allowsRotation = false
                box2.physicsBody?.allowsRotation = false
                box3.physicsBody?.allowsRotation = false
                box4.physicsBody?.allowsRotation = false
                box5.physicsBody?.allowsRotation = false
                box1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                box2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                box3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                box4.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                box5.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                bird2.position = originalPosition!
                box1.position = box1Position!
                box2.position = box2Position!
                box3.position = box3Position!
                box4.position = box4Position!
                box5.position = box5Position!
                box1.xScale = CGFloat(0.052)
                box2.xScale = CGFloat(0.052)
                box3.xScale = CGFloat(0.052)
                box4.xScale = CGFloat(0.052)
                box5.xScale = CGFloat(0.05)
                box1.yScale = CGFloat(0.054)
                box2.yScale = CGFloat(0.054)
                box3.yScale = CGFloat(0.054)
                box4.yScale = CGFloat(0.054)
                box5.yScale = CGFloat(0.054)
                box1.zRotation = CGFloat(signOf: 0,magnitudeOf: 0)
                box2.zRotation = CGFloat(signOf: 0,magnitudeOf: 0)
                box3.zRotation = CGFloat(signOf: 0,magnitudeOf: 0)
                box4.zRotation = CGFloat(signOf: 0,magnitudeOf: 0)
                box5.zRotation = CGFloat(signOf: 0,magnitudeOf: 0)
                
                gamestarted = false
                
            }
        }
        
    }
    
}
