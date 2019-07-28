//
//  First_pokemon_tests.swift
//  PokedexGoUITests
//
//  Created by Herbert Pereira Soares on 04/05/19.
//  Copyright © 2019 yigu. All rights reserved.
//

import XCTest

class First_pokemon_tests: BaseUITest {

    override func setUp() {
        super.setUp()
        application.launch()
    }
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testcheckFirstPokemonCatalogTest() {
        
        _ = CatalogBot(test: self)
            .assertTitlePokemon()
            .tabToBack()
        
        _ = Catalog2Bot(test: self)
            .assertPokemon1()
    }
}
