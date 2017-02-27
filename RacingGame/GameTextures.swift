//
//  GameTextures.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 2/27/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import Foundation
import SpriteKit

class GameTextures{
    
    static let sharedInstance = GameTextures()
    
    
    //MARK: Private class constants for names of texture files
    
    //VEHICLES and CHARACTERS
    private var carSprites = "Cars"
    private var motorcycleSprites = "Motorcycles"
    private var characterSprites = "Characters"
    private var robotSprites = "Robots"
    
    //OTHER GAME OBJECTS
    private var objectSprites = "Objects"

    
    //ENVIRONMENT TILES
    private var sandSprites = "Sand"
    private var sandRoadSprites = "SandRoad"
    private var grassSprites = "Grass"
    private var dirtSprites = "Dirt"
    private var dirtRoadSprites = "DirtRoad"
    private var asphaltRoadSprites = "AsphaltRoad"
    private var roadSprites = "Road"
    
    //GAME INTERFACE
    private var gameInterfaceSprites = "GameInterface"
    
    
    //MARK: Private class variables
    
    private var carSpriteAtlas: SKTextureAtlas = SKTextureAtlas()
    private var motorcycleSpriteAtlas = SKTextureAtlas()
    private var characterSpriteAtlas = SKTextureAtlas()
    private var robotSpriteAtlas = SKTextureAtlas()
    private var objectSpriteAtlas = SKTextureAtlas()
    private var sandSpriteTextureAtlas = SKTextureAtlas()
    private var sandRoadSpriteTextureAtlas = SKTextureAtlas()
    private var grassSpriteTextureAtlas = SKTextureAtlas()
    private var dirtSpriteTextureAtlas = SKTextureAtlas()
    private var dirtRoadSpriteTextureAtlas = SKTextureAtlas()
    private var asphaltRoadSpriteTextureAtlas = SKTextureAtlas()
    private var roadSpriteTextureAtlas = SKTextureAtlas()
    private var gameInterfaceSpriteTextureAtlas = SKTextureAtlas()
    
    //MARK: - Init
    private init(){
          carSpriteAtlas = SKTextureAtlas(named: carSprites)
          motorcycleSpriteAtlas = SKTextureAtlas(named: motorcycleSprites)
          characterSpriteAtlas = SKTextureAtlas(named: characterSprites)
          robotSpriteAtlas = SKTextureAtlas(named: robotSprites)
          objectSpriteAtlas = SKTextureAtlas(named: objectSprites)
          sandSpriteTextureAtlas = SKTextureAtlas(named: sandSprites)
          sandRoadSpriteTextureAtlas = SKTextureAtlas(named: sandRoadSprites)
          grassSpriteTextureAtlas = SKTextureAtlas(named: grassSprites)
          dirtSpriteTextureAtlas = SKTextureAtlas(named: dirtSprites)
          dirtRoadSpriteTextureAtlas = SKTextureAtlas(named: dirtRoadSprites)
          asphaltRoadSpriteTextureAtlas = SKTextureAtlas(named: asphaltRoadSprites)
          roadSpriteTextureAtlas = SKTextureAtlas(named: roadSprites)
          gameInterfaceSpriteTextureAtlas = SKTextureAtlas(named: gameInterfaceSprites)
        
    }
    
    //Helper Methods
    func texture(name: String) -> SKTexture{
        return SKTexture(imageNamed: name)
    }
    
    func sprite(name: String) -> SKSpriteNode{
        return SKSpriteNode(imageNamed: name)
    }
    
    
}
