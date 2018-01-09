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
    
    //If two are and one are not... not a set
    func matchCards(forArry: [SetCard]) -> Bool {
        if sameColor(forArry: forArry) && sameSymbol(forArry: forArry) {
            return true
        }
        else if !sameColor(forArry: forArry) && !sameSymbol(forArry: forArry)
            && !sameCount(forArry: forArry) {
            return true
        }
        return false
    }
    
    private func sameColor(forArry: [SetCard]) -> Bool {
        if forArry[0].color == forArry[1].color && forArry[1].color == forArry[2].color { //Same color
            return true
        }
        return false
    }
    
    private func sameSymbol(forArry: [SetCard]) -> Bool {
        if forArry[0].text == forArry[1].text && forArry[1].text == forArry[2].text { //Same text & number
            return true
        }
        return false
    }
    
    private func sameCount(forArry: [SetCard]) -> Bool {
        if forArry[0].howMany != forArry[1].howMany //Different numbers
            && forArry[0].howMany != forArry[2].howMany
            && forArry[1].howMany != forArry[2].howMany {
            return false
        }
        return true
    }
}
