//
//  Colors.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 2/27/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import Foundation
import SpriteKit


class ColorThemes{
    
    enum ColorfulTheme: Int{
        case blue = 0x30A7D8
        case grey = 0x9DBDBF
        case green = 0x24A34E
        case brown = 0xBF8347
        case orange = 0xF06D18
        
        var skColor: SKColor {
            return ColorConverter.colorFromHexValue(hexValue: self.rawValue)
        }
        
         
    }
    
    enum BrightTheme: Int{
        case blue = 0x9DBDBF
        case green = 0x24A34E
        case gold = 0xECBD03
        case brown = 0xBF8347
        case orange = 0xF06D18
        
        var skColor: SKColor {
            return ColorConverter.colorFromHexValue(hexValue: self.rawValue)
        }
        
    }
    
    enum DeepTheme: Int{
        case blue = 0x9EC0C2
        case green = 0x24A45A
        case lightbrown = 0xBF8348
        case orange = 0xEF6D17
        case white = 0xF4F2F2
        
        var skColor: SKColor {
            return ColorConverter.colorFromHexValue(hexValue: self.rawValue)
        }
     
        
    }
    
    enum MutedTheme: Int{
        case blue = 0xF06D18
        case lightgreen = 0x9EC0C2
        case green = 0x24A45A
        case lightbrown = 0xBF8348
        case orange = 0xEF6D17
        
        var skColor: SKColor {
            return ColorConverter.colorFromHexValue(hexValue: self.rawValue)
        }
        
    }
    
    enum DarkTheme: Int{
        case lightblue = 0x9EC0C2
        case lightgreen = 0x24A45A
        case darkgreen = 0x208B4B
        case darkgold = 0xBF8348
        case darkbrown = 0x8F7E7E
        
        var skColor: SKColor {
            return ColorConverter.colorFromHexValue(hexValue: self.rawValue)
        }
    }
    
}

class ColorConverter{
    
    
    //Dark Scheme
    static var lightblue: Int { return 0x9EC0C2 }
    static var lightgreen: Int {return 0x24A45A }
    static var darkgreen: Int {return 0x208B4B }
    static var darkgold: Int { return 0xBF8348 }
    static var darkbrown: Int { return 0x8F7E7E }

    //Bright Scheme
    static var brightBlue: Int { return 0x9DBDBF}
    static var brightGold: Int { return 0xECBD03}
    static var brightGreen: Int { return 0x24A34E}
    static var brightBrown: Int { return 0xBF8347 }
    static var brightOrange: Int { return 0xF06D18}
    
    //ColorFul Scheme
    static var colorfulBlue: Int { return 0x30A7D8}
    static var colorfulGrey: Int { return 0x9DBDBF}
    static var colorfulGreen: Int { return 0x24A34E}
    static var colorfulBrown: Int { return 0x24A34E }
    static var colorfulOrange: Int { return 0x24A34E}
    
    //Muted Scheme
    static var mutedBlue: Int { return 0xF06D18 }
    static var mutedLightgreen: Int {return 0x9EC0C2}
    static var mutedGreen: Int {return 0x24A45A}
    static var mutedLightbrown: Int { return 0xBF8348}
    static var mutedOrange: Int {return 0xEF6D17}
    
    //Deep Scheme
    static var deepBlue: Int { return 0x9EC0C2}
    static var deepGreen: Int {return 0x24A45A}
    static var deepLightbrown: Int {return 0xBF8348}
    static var deepOrange: Int {return 0xEF6D17}
    static var deepWhite: Int {return 0xF4F2F2}
    
    
    static func colorFromHexValue(hexValue: Int) -> SKColor {
        let red = ((hexValue & 0xFF0000) >> 16)/255
        let green = ((hexValue & 0x00FF00) >> 8)/255
        let blue = (hexValue & 0x0000FF)/255
        return SKColor(colorLiteralRed: Float(red), green: Float(green), blue: Float(blue), alpha: 1.0)
    }
    
    
}
