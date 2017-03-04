//
//  Rock.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 3/4/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import SpriteKit

enum RockType: String{
    case rock1
    case rock2
    case rock3
}

class Rock: SKSpriteNode {
    
    let initialSize: CGSize = CGSize(width: 40, height: 40)
  
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: nil, color: .clear, size: initialSize)
   
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func spawn(onParent parentNode: SKNode, atPosition position: CGPoint, withSize rockSize: CGSize, ofType rockType: RockType = .rock1){
        
        self.texture = getRockTexture(forRockType: rockType)
        self.size = size
        self.position = position
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: rockSize.width/2)
        self.physicsBody?.isDynamic = false
        
        self.physicsBody?.categoryBitMask = PhysicsCategory.barrier.rawValue
        self.physicsBody?.contactTestBitMask = PhysicsCategory.player.rawValue
        
        parentNode.addChild(self)
        
    }
    
    private func getRockTexture(forRockType rockType: RockType = .rock1) -> SKTexture{
        switch(rockType){
            case .rock1:
                return SKTexture(image: #imageLiteral(resourceName: "rock1"))
            case .rock2:
                return SKTexture(image: #imageLiteral(resourceName: "rock2"))
                break
            case .rock3:
                return SKTexture(image: #imageLiteral(resourceName: "rock3"))
                break
            default:
                return SKTexture(image: #imageLiteral(resourceName: "rock1"))
                break
        }
    }
}
