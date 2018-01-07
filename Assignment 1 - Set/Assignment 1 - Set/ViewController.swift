//
//  ViewController.swift
//  Assignment 1 - Set
//
//  Created by Charles Hennessey  on 1/6/18.
//  Copyright © 2018 Charles Hennessey . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //globals
    var numDeltCards = 0
    var deltSetCards = [SetCardButton]() //Delt cards holds used cards. We are using the same idea as a memory manager
    //UI Elements
    @IBOutlet weak var setLabel: DesignableLabel!
    @IBOutlet weak var flipLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var setCardButtonCollection: [SetCardButton]!
    
    //On Click
    @IBAction func dealButton(_ sender: DesignableButton) {
        var index = 0
        for setCard in setCardButtonCollection {
            if numDeltCards != 23,
                index > numDeltCards && !(index > numDeltCards+3)   {
                setCard.isHidden = false
            }
            index += 1
        }
        print(numDeltCards)
        numDeltCards += 3
    }
    @IBAction func setCardClicked(_ sender: SetCardButton) {
        sender.onSelect()
    }
    override func viewDidLoad() {
        for setCard in setCardButtonCollection {
            print(numDeltCards)
            if numDeltCards > 11 {
                setCard.isHidden = true
            }
            numDeltCards += 1
        }
        numDeltCards = 11
        
        
        //Init 56 Additional Set Cards (81 Total at startup)
        for _ in 0...56 {
            setCardButtonCollection.append(SetCardButton())
        }
        //Now 12 are initally delt, so move them into the delt list
//        for index in 0...23{
//            let tempSetCard = setCardButtonCollection[index]
//            setCardButtonCollection.remove(at: index)
//            deltSetCards.append(tempSetCard)
//        }
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
@IBDesignable
class SetCardButton: DesignableButton {
    var wasButtonSelected : Bool
    var setCard : SetCard
    required init?(coder aDecoder: NSCoder) {
        wasButtonSelected = false
        setCard = SetCard()
        super.init(coder: aDecoder)
        setAttributedTitle(setCard.textAttr, for: UIControlState.normal)
        
    }
    override init(frame: CGRect) {
        wasButtonSelected = false
        setCard = SetCard()
        super.init(frame: frame)
        setAttributedTitle(setCard.textAttr, for: UIControlState.normal)
    }
    
    func onSelect() {
        if !wasButtonSelected {
            self.borderColor = UIColor.red
            self.borderWidth = 5
            wasButtonSelected = true
        }
        else {
            self.borderColor = UIColor.black
            self.borderWidth = 3
            wasButtonSelected = false
        }
    }
}

//Designable Code for further Styling
@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
