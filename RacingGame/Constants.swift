//
//  Constants.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 2/27/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

//Constants

let kDebug = true
let kViewSize = UIScreen.main.bounds.size


//Fonts
let kFontKenPixelBlocksRegular = "KenPixel Blocks Regular"
let kFontKenPixelFutureSquare = "KenPixel Future Square Regular"
let kFontKenPixelFuture = "KenPixel Future Regular"
let kFontKenPixelHighSquare = "KenPixel High Square Regular"
let kFontKenPixelHigh = "KenPixel High Regular"

let kFontKenPixelMiniSquare = "KenPixel Mini Square Regular"
let kFontKenPixelMini = "KenPixel Mini Regular"
let kFontKenPixelNova = "KenPixel Nova Regular"
let kFontPixelSquare = "KenPixel Square Regular"
let kFontKenPixel = "KenPixel Regular"

let kFontKenVectorBold = "KenVector Bold Regular"
let kFontKenVectorFutureThinSqure = "KenVector Future Thin Square "
let kFontKenVectorFutureThin = "KenVector Future Thin Regular"
let kFontKenVectorFuture = "KenVector Future Regular"

//Category Bitmasks
let noCategory: UInt32 = 0
let playerCategory: UInt32 = 0b1
let carCategory: UInt32 = 0b1 << 1 //Other cars
let naturalBarrierCategory: UInt32 = 0b1 << 2     //Trees,rocks
let trackBarrierCategory: UInt32 = 0b1 << 3 //Cones, barrels, lights, empty tribune, guardrails
let oilCategory: UInt32 = 0b1 << 4 //Oil slicks
let peopleCategory: UInt32 = 0b1 << 5 //Spectators, tribunes with spectators
let robotCategory: UInt32 = 0b1 << 6 //Robots
let motorcycleCategory: UInt32 = 0b1 << 7 //Other motorcycles
let sandCategory: UInt32 = 0b1 << 8 //Sand




