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
    /**
     Deal 3 cards, return an array of them
     Move cards into delt cards.
     */
    mutating func deal() -> [SetCard]{
        var returnArry = [SetCard]()
        var tempCard : SetCard
        for index in 0...2 {
            if deck.count > index { //Dont empty it!
                tempCard = deck[index]
                deck.remove(at: index)
                returnArry.append(tempCard)
                deltCards.append(tempCard)
            }
        }
        return returnArry
    }
    
    func matchCards(forArry: [SetCard]) -> Bool {
        return true
    }
}
