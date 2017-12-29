//
//  Concentration.swift
//  Concentration
//
//  Created by Charles Hennessey  on 12/26/17.
//  Copyright © 2017 Charles Hennessey . All rights reserved.
//

import Foundation

class Concentration  {
    var cards = [Card]()
    var soleFaceUpCard: Int?
    func chooseCard(at index: Int){
         cards[index].isFaceUp = cards[index].isFaceUp ? false : true
        if !cards[index] .isMatched{
            if let matchedIndex = soleFaceUpCard, matchedIndex != index {
                if cards[matchedIndex].identifier == cards[index].identifier{
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                soleFaceUpCard = nil
            }
            else {
                for flipIndex in cards.indices {
                    cards[flipIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                soleFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairedCards: Int) {
        for _ in 1...numberOfPairedCards{
            let card = Card()
            cards += [card,card]
        }
        //TODO Shuffle The Cards
        for _ in cards.indices {
            let bound = UInt32.init(cards.count)
            let i = Int(arc4random_uniform(bound))
            let j = Int(arc4random_uniform(bound))
            cards.swapAt(i, j)
        }
    }

}
