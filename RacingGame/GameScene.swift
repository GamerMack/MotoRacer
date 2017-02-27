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

    private var gameSceneLabel: SKLabelNode?
    
    let gameTextures = GameTextures.sharedInstance
    
    var player = SKSpriteNode()
    
    var turnRightAction: SKAction = SKAction()
    var isTurningRight: Bool = false
    
    
    override func didMove(to view: SKView) {
        self.setup()
       
        
    }

    private func setup(){
        gameSceneLabel = SKLabelNode(fontNamed: "Arial")
        gameSceneLabel?.text = "GameScene"
        gameSceneLabel?.fontSize = 36.0
        gameSceneLabel?.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height/2)
        self.addChild(gameSceneLabel!)
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

            }
  
    
    func touchDown(atPoint pos : CGPoint) {
       

    }
    
    func touchMoved(toPoint pos : CGPoint) {
    
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        if(gameSceneLabel!.contains(touchLocation)){
            loadScene()
        }
        
    
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
    
    //MARK: - LoadScene
    private func loadScene(){
        let scene = GameOverScene(size: kViewSize)
        let transition = SKTransition.fade(with: UIColor.green, duration: 2.0)
        self.view?.presentScene(scene, transition: transition)
    }
}
