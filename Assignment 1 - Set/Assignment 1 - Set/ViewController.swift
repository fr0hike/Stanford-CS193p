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
    
    //UI Elements
    @IBOutlet weak var setLabel: DesignableLabel!
    @IBOutlet weak var flipLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var setCardCollection: [SetCardButton]!
    
    //On Click
    @IBAction func dealButton(_ sender: DesignableButton) {
        var index = 0
        for setCard in setCardCollection {
            
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
    }
    override func viewDidLoad() {
        for setCard in setCardCollection {
            print(numDeltCards)
            if numDeltCards > 11 {
                setCard.isHidden = true
            }
            numDeltCards += 1
        }
        numDeltCards = 11
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
@IBDesignable
class SetCardButton: DesignableButton {
    override func draw(_ rect: CGRect) {
        
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


/**
 Lecture Example Code.
 
 
 #Create a UIBezierPath
 -- in over-ridden UIView
 draw() {...}
 let path = UIBezierPath()
 path.move(to: CGPoint(xx, yy))
 path.addLine(to: CGPoint(xx, yy))
 ..
 ...
 ....
 path.close
 
 //Define Color
 UIColor.green.setFill()
 UIColor.red.setStroke()
 path.linewidth = 3.0
 path.fill()
 path.stroke()
 */
