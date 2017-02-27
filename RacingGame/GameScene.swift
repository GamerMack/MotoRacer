//
//  GameScene.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 2/26/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
   let motorcycle1 = SKSpriteNode(texture: MotorcycleAtlasManager.loadMotorcycleTexture(color: .blue))
    
    var turnRightAction: SKAction = SKAction()
    var isTurningRight: Bool = false
    
    override func didMove(to view: SKView) {
   
        
        let backgroundLayoutScene = GameScene(fileNamed: "Asphalt1")!
        let backgroundRootNode = backgroundLayoutScene.childNode(withName: "Root") as! SKSpriteNode
        backgroundRootNode.move(toParent: self)
        
        motorcycle1.position = CGPoint(x: 0, y: 0)
       // backgroundRootNode.addChild(motorcycle1)
   
        self.addChild(motorcycle1)
        
        let title = SKLabelNode(text: "Hazard Race 2")
        title.fontName = kFontKenPixelHigh
        title.position = CGPoint(x: 0, y: 30)
        
        self.addChild(title)
        
        
    }

    
    func configureMotorcycleActions(){
        
//        let turnRadius: Int = 500
//        let rotationIncrement: Int = 90/turnRadius
//    
//        
//        let turningTimeLength = 100;
//        let unitActionTimeLength = turningTimeLength/turnRadius
//        
//       var turnActionUnitGroup = [SKAction]()
//        
//        for _ in 1...turnRadius{
//          
//            let actionUnitGroup = SKAction.group([
//                SKAction.rotate(byAngle: CGFloat(rotationIncrement), duration: TimeInterval(unitActionTimeLength)),
//                SKAction.move(by: CGVector(dx: 5, dy: 5), duration: TimeInterval(unitActionTimeLength))
//                ])
//            
//            turnActionUnitGroup.append(actionUnitGroup)
//        
//        }
//        
//        let mainTurningAction = SKAction.sequence(turnActionUnitGroup)

        
        let mainTurningAction = SKAction.group([
            SKAction.rotate(byAngle: 90.0, duration: 10),
            SKAction.move(by: CGVector(dx: 50, dy: 50), duration: 10)
            ])
        
        turnRightAction = mainTurningAction

    }
  
    
    func touchDown(atPoint pos : CGPoint) {
        isTurningRight = !isTurningRight
        
        if(isTurningRight){
            motorcycle1.removeAction(forKey: "turnRight")
        } else {
            motorcycle1.run(turnRightAction, withKey: "turnRight")
        }

    }
    
    func touchMoved(toPoint pos : CGPoint) {
    
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
