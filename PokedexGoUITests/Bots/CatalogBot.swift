//
//  CatalogBot.swift
//  PokedexGoUITests
//
//  Created by Herbert Pereira Soares on 04/05/19.
//  Copyright © 2019 yigu. All rights reserved.
//

import XCTest
import UIBot

class CatalogBot: Bot {
    
    //Asserts
    private let title: String = "Bulbasaur"
    private let titlePokemon: String = "Bulbasaur #001"
    private let btnBackToPokedex: String = "Pokedex Go"
    private let txtPokemon10: String = "#010, 绿毛虫"
    private let txtPokemon1: String = "#001, Bulbasaur"
    
    //Inputs
    private let searchField: String = "product_search"
    
    //Actions
    private let catalogCategoryCell: String = "categoryCell"
    private let catalogProductCell: String = "productCell_transferSku"
    
    override func trait() -> XCUIElement? {
        return app.navigationBars[title]
    }
    
    func assertTitlePokemon() -> Self {
        return assertContains(text: titlePokemon)
    }
    
    func tabToBack() -> Self {
        return tapLabel(text: btnBackToPokedex)
    }
}

