//
//  HelperFunctions.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 2/27/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import Foundation
import SpriteKit

//Helper function for unit conversions
let piToEightDecimalPlaces: CGFloat = 3.14159265;

func convertToDegreesFrom(radiansOf radians: CGFloat)->CGFloat{
    
    return (radians*CGFloat(180.0)/piToEightDecimalPlaces)
}

func convertToRadiansFrom(degreesOf degrees: CGFloat) -> CGFloat{
    return (degrees*piToEightDecimalPlaces/CGFloat(180.0))
}


func getSpriteWithNameOf(spriteName: String, fromSceneWithNameOf sceneName: String) ->SKSpriteNode{
    
    let scene = GameScene(fileNamed: sceneName)!
    let sprite = scene.childNode(withName: spriteName) as! SKSpriteNode
    
    return sprite
}
