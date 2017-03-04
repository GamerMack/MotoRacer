//
//  BitmaskCategories.swift
//  RacingGame
//
//  Created by Aleksander Makedonski on 3/4/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import Foundation


enum PhysicsCategory: UInt32{
    case noCategory = 1
    case player = 2
    case barrier = 4
    case enemy = 8
    case oil = 16
}
