//
//  Card.swift
//  Concentration
//
//  Created by Charles Hennessey  on 12/26/17.
//  Copyright © 2017 Charles Hennessey . All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    static var identitifierFactory = 0
    static func getUniqueIdentifier() -> Int{
        identitifierFactory += 1
        return identitifierFactory
    }
}
