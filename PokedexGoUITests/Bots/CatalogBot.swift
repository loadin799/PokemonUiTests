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
    private let title: String = "herbert"
    private let titlePokemon: String = "herbert #001"
    
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
    
    
//    func fill(search: String) -> Self {
//        return write(text: search, atTextFieldWithID: searchField)
//    }
//
//    func tapCatalogCategoryCell(text: String) -> Self {
//        return tapLabel(text: text)
//    }
//
//    func tapCatalogProductCell(text: String) -> Self {
//        return tapLabel(text: text)
//    }
//
//    func scrollUntilFind(labelText: String) -> Self {
//        return scroll(at: 0, untilTextExists: labelText, direction: .up)
//    }
//
}

