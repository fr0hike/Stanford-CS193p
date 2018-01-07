//
//  SetModel.swift
//  Assignment 1 - Set
//
//  Created by Charles Hennessey  on 1/7/18.
//  Copyright © 2018 Charles Hennessey . All rights reserved.
//

import Foundation
import UIKit

struct SetModel {
    var deck = [SetCard]()
    var deltCards = [SetCard]()
    var numberOfDeltCards: Int {
        get {
            return self.deltCards.count
        }
    }
    
    init() {
        //Init deck
        for _ in 0...80 {
            deck.append(SetCard())
        }
        //Deal 24 cards
        for index in 0...23 {
            let tempCard = deck[index]
            deck.remove(at: index)
            deltCards.append(tempCard)
        }
    }
}
