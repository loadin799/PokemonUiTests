//
//  PokemoUIApplication.swift
//  PokedexGoUITests
//
//  Created by Herbert Pereira Soares on 04/05/19.
//  Copyright © 2019 yigu. All rights reserved.
//


import Foundation
import XCTest

class PokemonUIApplication: XCUIApplication {
    
    override init() {
        super.init()
        
        launchArguments.append("-FNTesting")
    }
}
