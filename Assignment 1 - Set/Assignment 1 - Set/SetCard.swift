//
//  SetCard.swift
//  Assignment 1 - Set
//
//  Created by Charles Hennessey  on 1/7/18.
//  Copyright © 2018 Charles Hennessey . All rights reserved.
//

import Foundation
import UIKit
struct SetCard {
    
    var color: UIColor?
    var howMany: Int?
    var text: String?
    var textAttr: NSAttributedString?
    
    init() {
        color = colors[rand()]
        howMany = rand() + 1
        text = getBtnText()
        textAttr = attributes()
    }
    //Private constants
    private let symbols = ["▲","■","●"]
    private let colors = [UIColor.red,UIColor.blue,UIColor.green]
    private let sizes = [1,2,3]
    //Private functions
    private func getBtnText() -> String {
        let symbol = symbols[rand()]
        switch howMany! {
        case 1:
            return symbol
        case 2:
            return "\(symbol)\(symbol)"
        case 3:
            return "\(symbol)\(symbol)\(symbol)"
        default:
            return symbol
        }
    }
    
    private func attributes() ->NSAttributedString {
        //Attrs
        let btnAttrs = [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 28),
            NSAttributedStringKey.foregroundColor : color,
            NSAttributedStringKey.backgroundColor : UIColor.white
        ]
        let attrText =  NSMutableAttributedString(string: self.text!)
        attrText.setAttributes(btnAttrs, range: (self.text! as! NSString).range(of: self.text!))
        return NSAttributedString(attributedString: attrText)
    }
    
    private func rand() -> Int {
        return Int(arc4random_uniform(2 - 0 + 1) + 0) //0-2
    }
    
}
