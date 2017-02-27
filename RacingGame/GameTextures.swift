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
    private var carSprites = "Cars.atlas"
    private var motorcycleSprites = "Motorcycles.atlas"
    private var characterSprites = "Characters.atlas"
    private var robotSprites = "Robots.atlas"
    
    //OTHER GAME OBJECTS
    private var objectSprites = "Objects.atlas"

    
    //ENVIRONMENT TILES
    private var sandSprites = "Sand.atlas"
    private var sandRoadSprites = "SandRoad.atlas"
    private var grassSprites = "Grass.atlas"
    private var dirtSprites = "Dirt.atlas"
    private var dirtRoadSprites = "DirtRoad.atlas"
    private var asphaltRoadSprites = "AsphaltRoad.atlas"
    private var roadSprites = "Road.atlas"
    
    //GAME INTERFACE
    private var gameInterfaceSprites = "GameInterface.atlas"
    
    
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
          self.carSpriteAtlas = SKTextureAtlas(named: carSprites)
          self.motorcycleSpriteAtlas = SKTextureAtlas(named: motorcycleSprites)
          self.characterSpriteAtlas = SKTextureAtlas(named: characterSprites)
          self.robotSpriteAtlas = SKTextureAtlas(named: robotSprites)
          self.objectSpriteAtlas = SKTextureAtlas(named: objectSprites)
          self.sandSpriteTextureAtlas = SKTextureAtlas(named: sandSprites)
          self.sandRoadSpriteTextureAtlas = SKTextureAtlas(named: sandRoadSprites)
          self.grassSpriteTextureAtlas = SKTextureAtlas(named: grassSprites)
          self.dirtSpriteTextureAtlas = SKTextureAtlas(named: dirtSprites)
          self.dirtRoadSpriteTextureAtlas = SKTextureAtlas(named: dirtRoadSprites)
          self.asphaltRoadSpriteTextureAtlas = SKTextureAtlas(named: asphaltRoadSprites)
          self.roadSpriteTextureAtlas = SKTextureAtlas(named: roadSprites)
          self.gameInterfaceSpriteTextureAtlas = SKTextureAtlas(named: gameInterfaceSprites)
        
    }
    
    //Helper Methods
    func carTextureWithName(name: String) -> SKTexture{
        return carSpriteAtlas.textureNamed(name)
    }
    
    func texture(name: String) -> SKTexture{
        return SKTexture(imageNamed: name)
    }
    
    func sprite(name: String) -> SKSpriteNode{
        return SKSpriteNode(imageNamed: name)
    }
    
    
}
