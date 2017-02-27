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
    static let dirtPathTextureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Dirt.atlas")
    
    static func loadDirtPathTexture(pathType: DirtPathType) -> SKTexture{
        let image = loadDirtPathImage(pathType: pathType)
        
        return SKTexture(image: image)
    }
    
    static private func loadDirtPathImage(pathType: DirtPathType) -> UIImage{
        switch(pathType){
        case .Bottom:
            return #imageLiteral(resourceName: "land_sand14")
        case .Top:
            return #imageLiteral(resourceName: "land_dirt14")
        case .Right:
            return #imageLiteral(resourceName: "land_sand04")
        case .Left:
            return #imageLiteral(resourceName: "land_sand06")
        case .AllDirt:
            return #imageLiteral(resourceName: "land_dirt05")
        case .AllSand:
            return #imageLiteral(resourceName: "land_sand12")
        case .TopLeftOuter:
            return #imageLiteral(resourceName: "land_sand02")
        case .TopLeftInner:
            return #imageLiteral(resourceName: "land_sand13")
        case .TopRightOuter:
            return #imageLiteral(resourceName: "land_dirt01")
        case .TopRightInner:
            return #imageLiteral(resourceName: "land_dirt03")
        case .BottomLeftOuter:
            return #imageLiteral(resourceName: "land_sand07")
        case .BottomLeftInner:
            return #imageLiteral(resourceName: "land_sand09")
        case .BottomRightOuter:
            return #imageLiteral(resourceName: "land_dirt11")
        case .BottomRightInner:
            return #imageLiteral(resourceName: "land_sand11")
        }
    }
    
}
