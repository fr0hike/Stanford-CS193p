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
    var numberOfUnHiddenButtons = 11 //Default Value
    var gameBrain = SetModel()
    //UI Elements
    @IBOutlet weak var setLabel: DesignableLabel!
    @IBOutlet weak var flipLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var setCardButtonCollection: [SetCardButton]!
    
    //On Click
    @IBAction func dealButton(_ sender: DesignableButton) {
        
        if numberOfUnHiddenButtons <= 23 { //Show hidden buttons
            var numberOfIterations = 0
            for index in  numberOfUnHiddenButtons...numberOfUnHiddenButtons + 3 {
                if index <= (setCardButtonCollection.count - 1) {
                    setCardButtonCollection[index].isHidden = false
                    numberOfIterations += 1
                }
            }
            numberOfUnHiddenButtons += numberOfIterations
        }
        else { //Replace current
            
        }
        print(numberOfUnHiddenButtons)
    }
    @IBAction func setCardClicked(_ sender: SetCardButton) {
        var attributedString : NSAttributedString
        let labelText = setLabel.attributedText
        sender.onSelect()
        if(sender.wasButtonSelected){
            attributedString = (sender.setCard?.textAttr!)!
            setLabel.attributedText = concatStrings(left: labelText!, right: attributedString)
        }
        else {
            
        }
        
    }
    func concatStrings(left: NSAttributedString, right: NSAttributedString) -> NSAttributedString{
        let result = NSMutableAttributedString()
        result.append(left)
        result.append(right)
        return result
    }
    override func viewDidLoad() {
        //init SetCardButtons with SetCards
        var index = 0
        for setCard in setCardButtonCollection {
            setCard.defineSetCard(setCard: gameBrain.deltCards[index])
            index += 1
        }
        //Hide half of them
        for atPoint in 12...(setCardButtonCollection.count - 1) {
            setCardButtonCollection[atPoint].isHidden = true
        }
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
    var setCard : SetCard?
    
    func defineSetCard(setCard:SetCard){
        self.setCard = setCard
        setAttributedTitle(setCard.textAttr, for: UIControlState.normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        wasButtonSelected = false
        super.init(coder: aDecoder)
        
        
    }
    override init(frame: CGRect) {
        wasButtonSelected = false
        super.init(frame: frame)
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
