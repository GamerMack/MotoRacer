//
//  DirtAtlasManager.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 2/26/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


enum DirtPathType{
    case TopLeftOuter
    case TopLeftInner
    case TopRightOuter
    case TopRightInner
    case BottomLeftOuter
    case BottomLeftInner
    case BottomRightOuter
    case BottomRightInner
    case Top
    case Bottom
    case Right
    case Left
    case AllDirt
    case AllSand
}


class DirtPathAtlasManager{
    static let gameTextures = GameTextures.sharedInstance
    
    static func loadDirtPathTexture(dirtPathType: DirtPathType) -> SKSpriteNode{
        let texture = loadDirtPathTexture(pathType: dirtPathType)
        
        return SKSpriteNode(texture: texture)
    }
    
    static private func loadDirtPathTexture(pathType: DirtPathType) -> SKTexture{
        switch(pathType){
        case .Bottom:
            return gameTextures.texture(name: "land_sand14")
        case .Top:
            return gameTextures.texture(name: "land_dirt14")
        case .Right:
            return gameTextures.texture(name: "land_sand04")
        case .Left:
            return gameTextures.texture(name: "land_sand06")
        case .AllDirt:
            return gameTextures.texture(name: "land_dirt05")
        case .AllSand:
            return gameTextures.texture(name: "land_sand05")
        case .TopLeftOuter:
            return gameTextures.texture(name: "land_sand02")
        case .TopLeftInner:
            return gameTextures.texture(name: "land_sand13")
        case .TopRightOuter:
            return gameTextures.texture(name: "land_dirt01")
        case .TopRightInner:
            return gameTextures.texture(name: "land_dirt03")
        case .BottomLeftOuter:
            return gameTextures.texture(name: "land_sand07")
        case .BottomLeftInner:
            return gameTextures.texture(name: "land_sand09")
        case .BottomRightOuter:
            return gameTextures.texture(name: "land_dirt11")
        case .BottomRightInner:
            return gameTextures.texture(name: "land_sand11")
        }
    }
    
}
