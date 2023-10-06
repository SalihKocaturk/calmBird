Overview

This is a simple clone of the popular mobile game Angry Birds developed using Swift and spriteKit. This game is a game where players launch birds with a slingshot to destroy and 
taking down the structures and the boxes. This README provides information on how to set up and run the game, as well as details on its features and mechanics.

Set Up

First of all i download the game pictures from opengameart which we can reach free game pictures.
Then i add some nodes at gameScene.sks, as you can see at READMEIMAGES/IMG1.
After that i assigned the all of the phycsical conditions and i create a manual node for the bird
```
class GameScene: SKScene,SKPhysicsContactDelegate {
   var bird2 = SKSpriteNode()
    var box1 = SKSpriteNode()
    var slingShot = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
 override func didMove(to view: SKView) {
let boxtexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: boxtexture.size().width / 12, height: boxtexture.size().height / 12)
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.mass = 0.4
        box1.zPosition = 1
box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.mass = 0.4
        box2.zPosition = 1
 box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.mass = 0.4
        box3.zPosition = 1
box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.mass = 0.4
      
        box4.zPosition = 1
        
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.mass = 0.4
        box5.zPosition = 1
}
}
```
