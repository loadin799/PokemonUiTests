//
//  ElementReference.swift
//  PokedexGoUITests
//
//  Created by Hebert Soares on 06/07/19.
//  Copyright © 2019 yigu. All rights reserved.
//

import Foundation


enum ElementReference {
    
    enum menu {
        static let list = "List"
        static let cart = "Cart"
        static let search = "Search"
        static let checkout = "Checkout"
    }
    
    enum cart {
        static let tittle = "CART"
        static let total = "Total"
        static let price = "$0.00"
        static let checkout = "CHECKOUT"
        static let delete = "Delete"
    }
    
    enum general {
        static let menu = "SHOPPING APP"
        static let list = "LIST"
        static let card = "CART"
        static let search = "SEARCH"
    }
    
    enum item {
        static let addCard = "ADD TO CART"
        static let success = "Successful"
        static let addItem = "Increment"
    }
    
    enum search {
        static let searchItem = "Search Item"
        static let success = "Successful"
        static let addItem = "Increment"
    }
    
    enum checkout {
        static let tittle = "CHECKOUT"
        static let card = "XXXX XXXX XXXX XXXX"
        static let mounth = "MM"
        static let year = "YYYY"
        static let cvv = "CVV"
        static let payNow = "PAY NOW"
        static let pay = "Pay"
        static let thanksMEssage = "Thank you for shopping!"
        static let orderMessage = "Your order has been placed."
        static let keepShopping = "KEEP SHOPPING"
        static let priceZero = "$0.00"
    }
}
