//
//  Player.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 3/4/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import Foundation
import SpriteKit


class Player: SKSpriteNode{
    let constantMovingVelocity = CGFloat(600)
    
    var smokeEmitterNode: SKEmitterNode? = SKEmitterNode(fileNamed: "Smoke1.sks")
    var explodeAnimation = SKAction()
    var health: Int = 3
    
    init(){
        let defaultTexture = SKTexture(image: #imageLiteral(resourceName: "motorcycle_red"))
        let defaultSize = defaultTexture.size()
        super.init(texture: defaultTexture , color: .clear, size: defaultSize)
    
    }
    
    
    func spawn(parentNode: SKNode, position: CGPoint?, motorcycleTexture: SKTexture?){
        self.texture = motorcycleTexture ?? SKTexture(image: #imageLiteral(resourceName: "motorcycle_red"))
        self.position = position ?? CGPoint(x: 180, y: 40)
        self.zPosition = 3
        configurePhysicsProperties()
        configureEmitterNodes()
        configureBitMasks()
        
        parentNode.addChild(self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   
    
    
    //MARK: - Private helper functions
    private func configurePhysicsProperties(){
        self.userData?.setValue(1000, forKey: "healthLevel")
        self.physicsBody = SKPhysicsBody(texture: self.texture! , size: self.size)
        self.physicsBody?.affectedByGravity = false
        
        //Set player's initial default velocity
        self.physicsBody?.velocity.dy = constantMovingVelocity/4.0
        
        
    }
    
    private func configureBitMasks(){
        self.physicsBody?.categoryBitMask = PhysicsCategory.player.rawValue
        self.physicsBody?.collisionBitMask = PhysicsCategory.barrier.rawValue
        self.physicsBody?.contactTestBitMask = PhysicsCategory.barrier.rawValue
        
    }
    
    private func configureEmitterNodes(){
        
        //Configure the smoke emitter node that runs as the motorcycle engine runs
        if let smokeEmitterNode = self.smokeEmitterNode{
            smokeEmitterNode.zPosition = 2
            self.addChild(smokeEmitterNode)
            smokeEmitterNode.position = CGPoint(x: 0, y: -30)
        }
        
    }
    
    
    private func configureAnimations(){
        
        
        explodeAnimation = SKAction.animate(with: [
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion00")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion01")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion02")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion03")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion04")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion05")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion06")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion07")),
            SKTexture(image: #imageLiteral(resourceName: "regularExplosion08"))
            ], timePerFrame: 0.2)
        
        
    }
    
    
    func update(){
        self.physicsBody?.velocity.dy = constantMovingVelocity
        
    }
    
    func respondToTouchesBegan(deltaX: Int){
        var angleOfRotation: Int?
    
        switch(deltaX){
            
        case -20 ... 20:
            angleOfRotation = 0
            break
        case 20 ... 50:
            angleOfRotation = -20
            break
        case 50 ... 200:
            angleOfRotation = -40
            break
        case 200 ... 1000:
            angleOfRotation = -50
            break
        case -50 ... -20:
            angleOfRotation = 20
            break
        case -200 ... -50:
            angleOfRotation = 40
            break
        case -1000 ... -200:
            angleOfRotation = 50
            break
        default:
            break
            
        }
        
        if let angle = angleOfRotation{
            let adjustedAngleOfRotation = convertToRadiansFrom(degreesOf: CGFloat(angle))
            self.run(SKAction.rotate(toAngle: adjustedAngleOfRotation, duration: 0.3))
            
        }
    }
    
    func takeDamage(){
        
        if(health <= 0){
            self.physicsBody?.velocity = CGVector.zero
            let dieAnimation = SKAction.sequence([
                SKAction.wait(forDuration: 2.0),
                self.explodeAnimation,
                SKAction.wait(forDuration: 2.0),
                SKAction.removeFromParent()
                ])
            
            self.run(dieAnimation)
            
        }
        
        health -= 1
    }
    

}
