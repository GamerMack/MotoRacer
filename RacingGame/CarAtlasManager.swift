//
//  Car.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 2/26/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

//TODO: Need to refactor this class so that it makes use of the singletons

import Foundation
import SpriteKit
import UIKit

enum CarSize{
    case regular
    case small
}

enum CarColor{
    case red
    case blue
    case black
    case green
    case yellow
}

enum CarStyle{
    case style1
    case style2
    case style3
    case style4
}

class CarAtlasManager{
    
    static let gameTextures = GameTextures.sharedInstance
    
    static func loadCarSprite(carConfigurationTuple: (CarColor,CarSize,CarStyle)) -> SKSpriteNode{
        let texture = loadCarTexture(carConfigurationTuple: carConfigurationTuple)
        return SKSpriteNode(texture: texture)
    }
    
    static private func loadCarTexture(carConfigurationTuple: (CarColor,CarSize,CarStyle))
         -> SKTexture{
            
        switch (carConfigurationTuple) {
            case (.blue,.regular,.style1):
                return gameTextures.texture(name: "car_blue_1")
            case(.blue,.regular,.style2):
                return gameTextures.texture(name: "car_blue_2")
            case(.blue,.regular,.style3):
                return gameTextures.texture(name: "car_blue_3")
            case(.blue,.regular,.style4):
                return gameTextures.texture(name: "car_blue_4")
            case (.blue,.small,.style1):
                return gameTextures.texture(name: "car_blue_small_1")
            case(.blue,.small,.style2):
                return gameTextures.texture(name: "car_blue_small_2")
            case(.blue,.small,.style3):
                return gameTextures.texture(name: "car_blue_small_3")
            case(.blue,.small,.style4):
                return gameTextures.texture(name: "car_blue_small_4")
            case (.black,.regular,.style1):
                return gameTextures.texture(name: "car_black_1")
            case(.black,.regular,.style2):
                return gameTextures.texture(name: "car_black_2")
            case(.black,.regular,.style3):
                return gameTextures.texture(name: "car_black_3")
            case(.black,.regular,.style4):
                return gameTextures.texture(name: "car_black_4")
            case (.black,.small,.style1):
                return gameTextures.texture(name: "car_black_small_1")
            case(.black,.small,.style2):
                return gameTextures.texture(name: "car_black_small_2")
            case(.black,.small,.style3):
                return gameTextures.texture(name: "car_black_small_3")
            case(.black,.small,.style4):
                return gameTextures.texture(name: "car_black_small_4")
            case (.red,.regular,.style1):
                return gameTextures.texture(name: "car_red_1")
            case(.red,.regular,.style2):
                return gameTextures.texture(name: "car_red_2")
            case(.red,.regular,.style3):
                return gameTextures.texture(name: "car_red_3")
            case(.red,.regular,.style4):
                return gameTextures.texture(name: "car_red_4")
            case (.red,.small,.style1):
                return gameTextures.texture(name: "car_red_small_1")
            case(.red,.small,.style2):
                return gameTextures.texture(name: "car_red_small_2")
            case(.red,.small,.style3):
                return gameTextures.texture(name: "car_red_small_3")
            case(.red,.small,.style4):
                return gameTextures.texture(name: "car_red_small_4")
            case (.green,.regular,.style1):
                return gameTextures.texture(name: "car_green_1")
            case(.green,.regular,.style2):
                return gameTextures.texture(name: "car_green_2")
            case(.green,.regular,.style3):
                return gameTextures.texture(name: "car_green_3")
            case(.green,.regular,.style4):
                return gameTextures.texture(name: "car_green_4")
            case (.green,.small,.style1):
                return gameTextures.texture(name: "car_green_small_1")
            case(.green,.small,.style2):
                return gameTextures.texture(name: "car_green_small_2")
            case(.green,.small,.style3):
                return gameTextures.texture(name: "car_green_small_3")
            case(.green,.small,.style4):
                return gameTextures.texture(name: "car_green_small_4")
            case (.yellow,.regular,.style1):
                return gameTextures.texture(name: "car_yellow_1")
            case(.yellow,.regular,.style2):
                return gameTextures.texture(name: "car_yellow_2")
            case(.yellow,.regular,.style3):
                return gameTextures.texture(name: "car_yellow_3")
            case(.yellow,.regular,.style4):
                return gameTextures.texture(name: "car_yellow_4")
            case (.yellow,.small,.style1):
                return gameTextures.texture(name: "car_yellow_small_1")
            case(.yellow,.small,.style2):
                return gameTextures.texture(name: "car_yellow_small_2")
            case(.yellow,.small,.style3):
                return gameTextures.texture(name: "car_yellow_small_3")
            default:
                return gameTextures.texture(name: "car_black_1")
        }
        
    }
}



