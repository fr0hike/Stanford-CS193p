//
//  ViewController.swift
//  Assignment 1
//
//  Created by Charles Hennessey  on 12/31/17.
//  Copyright © 2017 Charles Hennessey . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Model
    var logic = Calculator()
    
    var equalHit = false {
        didSet {
            if equalHit == true {
                clearInputLabel()
                equalHit = false
            }
        }
    }
    
    //var oldResult = ""
    
    //UI Refs
    @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet weak var inputLabel: UILabel!
    
    //UI Events
    @IBAction func onClick(_ sender: UIButton) {
        var btnTxt = sender.titleLabel?.text!
        resultLabel.text = ""
        switch btnTxt! {
        case "C":
            clearInputLabel()
            logic.oldResult = ""
            //oldResult = ""
            break
        case "=":
//            print("old: " + oldResult)
//            print("cur: " + inputLabel.text!)
            let result = logic.comput(value:inputLabel.text!)
            resultLabel.text = result
//            oldResult = result!
            equalHit = true
            btnTxt = ""
            break
        case "del":
            var oldtxt = inputLabel.text!
            if oldtxt.count < 1 {
                break
            }
            oldtxt.remove(at: oldtxt.index(before: oldtxt.endIndex))
            clearInputLabel()
            btnTxt = oldtxt
            break
        case "e":
            btnTxt = "2.71828"
            break
        case "π":
            btnTxt = "3.14159"
            break
        case "rand":
            btnTxt = String(arc4random())
            break
        default:
            break
        }
        appendLabel(value : btnTxt!)
    }
    
    //Helper Methods
    fileprivate func formalLabel() {
        let txt = inputLabel.text!
        let newtext = txt.replacingOccurrences(of: ". ", with: ".", options: .literal, range: nil)
        let finaltxt = newtext.replacingOccurrences(of: " .", with: ".", options: .literal, range: nil)
        inputLabel.text = finaltxt
    }
    
    private func appendLabel(value : String) {
        inputLabel.text?.append(value)
        formalLabel()
        if inputLabel.text!.contains("C") || inputLabel.text!.contains("del"){
            clearInputLabel()
        }
    }
    
    private func clearInputLabel(){
        inputLabel.text = ""
    }

}

