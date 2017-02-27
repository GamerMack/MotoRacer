//
//  HelperFunctions.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 2/27/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import Foundation
import SpriteKit


func getSpriteWithNameOf(spriteName: String, fromSceneWithNameOf sceneName: String) ->SKSpriteNode{
    
    let scene = GameScene(fileNamed: sceneName)!
    let sprite = scene.childNode(withName: spriteName) as! SKSpriteNode
    
    return sprite
}
