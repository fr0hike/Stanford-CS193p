//
//  ViewController.swift
//  Concentration
//
//  Created by Charles Hennessey  on 12/26/17.
//  Copyright © 2017 Charles Hennessey . All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    lazy var game = Concentration(numberOfPairedCards : (cardList.count + 1) / 2)
    var emojiChoices = ["👻","😀","😍","🧡","🐭","🐝","🐙","🐸"]
    var emojis = Dictionary<Int,String>()
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardList: [UIButton]!
    @IBOutlet weak var newGameBtn: UIButton!
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flip Count: \(flipCount)"
            if flipCount > 10 {
                newGameBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
    }
    
   
    @IBAction func newGame(_ sender: UIButton) {
        flipCount = 0
        emojiChoices = ["👻","😀","😍","🧡","🐭","🐝","🐙","🐸"]
        game = Concentration(numberOfPairedCards : (cardList.count + 1) / 2)
        updateViewFromModel()
        newGameBtn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardList.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("error")
        }
        
    }
    
    func updateViewFromModel(){
        for index in cardList.indices {
            let button = cardList[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9517545266, green: 0.9775609545, blue: 1, alpha: 1)
            }
            else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9517545266, green: 0.9775609545, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.564555534, blue: 0.03691877909, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emojis[card.identifier] == nil, emojiChoices.count > 0 {
            let bound = UInt32.init(emojiChoices.count)
            let randomIndex = Int(arc4random_uniform(bound))
            emojis[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emojis[card.identifier] ?? "?"
    }
    

    
}

