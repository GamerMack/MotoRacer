//
//  MotorCycleAtlasManager.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 2/26/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit


/*This enum type is not preferred, since the filenames are subject to change */
enum MotorcycleType: String{
    case motorcyle_black
    case motorcycle_yellow
    case motorcycle_red
    case motorcyle_green
    case motorcycle_blue
    
    
    func getMotorcycleTexture() -> SKTexture?{
        guard let mImage = self.getMotorcycleImage() else {return nil}
        
        return SKTexture(image: mImage)
    }
    
    private func getMotorcycleImage() -> UIImage?{
        
        guard let image = UIImage(named: self.rawValue) else { return nil}
        
        return image
    }
    
}






enum MotorcycleColor{
    case black
    case blue
    case green
    case red
    case yellow
    
}


class MotorcycleAtlasManager{
    static let motorcycleTextureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Motorcycles.atlas")
    
    static func loadMotorcycleTexture(color: MotorcycleColor) -> SKTexture{
        let image = loadMotorcycleImage(color: color)
        return SKTexture(image: image)
    }
    
    static private func loadMotorcycleImage(color: MotorcycleColor) -> UIImage{
        switch(color){
        case .black:
            return #imageLiteral(resourceName: "motorcycle_black")
        case .blue:
            return #imageLiteral(resourceName: "motorcycle_blue")
        case .green:
            return #imageLiteral(resourceName: "motorcycle_green")
        case .red:
            return #imageLiteral(resourceName: "motorcycle_red")
        case .yellow:
            return #imageLiteral(resourceName: "motorcycle_yellow")
        }
    }
}
