//
//  Catalog2Bot.swift
//  PokedexGoUITests
//
//  Created by Hebert Soares on 29/06/19.
//  Copyright © 2019 yigu. All rights reserved.
//

import XCTest
import UIBot

class Catalog2Bot: Bot {
    
    //Asserts
    private let title2: String = "Pokedex Go"
    private let titlePokemon: String = "Bulbasaur #001"
    private let btnBackToPokedex: String = "Pokedex Go"
    private let txtPokemon10: String = "绿毛虫"
    private let txtPokemon1: String = "Bulbasaur"
    private let writePokemon: String = "Bulbasaur"
    
    //Inputs
    private let searchField: String = "Search Pokemon"
    
    //Actions
    private let catalogCategoryCell: String = "categoryCell"
    private let catalogProductCell: String = "productCell_transferSku"
    
    override func trait() -> XCUIElement? {
        return app.navigationBars[title2]
    }
    
    func assertPokemon1() -> Self {
        return assertContains(text: txtPokemon1)
    }
    
    func scrollUntilFind() -> Self {
        return scroll(at: 2, untilTextExists: txtPokemon10, direction: .down)
    }
    
    func fillPokemon() -> Self {
        return write(text: writePokemon, atTextFieldWithID: searchField)
    }
}
