//
//  Calculator.swift
//  Assignment 1
//
//  Created by Charles Hennessey  on 1/1/18.
//  Copyright © 2018 Charles Hennessey . All rights reserved.
//
//
//
// MODEL
// This used NSExpression todo most of the heavy lifting for me. Coming from a Java-Background, there isn't a nice way
// Todo error handeling as in Java. I wanted to experiment with more Swift features, so while this might seem over the top,
// it made for good fun :)

import Foundation


struct Calculator {
   
    // Base Method
    func comput(value : String) -> String?  {
        let expression = extractBaseExpression(val: value)
        if value.contains("sqrt") {
            let parsedExpression = "sqrt(" + expression + ")"
            return getResult(value : parsedExpression)
        }
        else if value.contains("cos") {
            return String(cos(Double(getResult(value: expression))!))
        }
        else if value.contains("sqr"){
            let parsedExpression = expression + "*" + expression 
            return getResult(value : parsedExpression)
        }
        else {
            return getResult(value: expression)
        }
        
    }
    //Helpers
    private func extractBaseExpression(val : String) -> String {
        return val.replacingOccurrences(of: "sqrt", with: "").replacingOccurrences(of: "cos", with: "")
            .replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "x", with: "*", options: .literal, range: nil)
        .replacingOccurrences(of: "sqr", with: "")
    }
    
    private func getResult(value : String) -> String {
        if !isValidExpression(expression: value){
            return value
        }
        let mathExpression = NSExpression(format: value)
        let mathValue = mathExpression.expressionValue(with: nil, context: nil) as? Double
        return String(describing: mathValue!)
    }
    private func isValidExpression(expression : String) -> Bool {
        //Remove spaces
        let value = expression.replacingOccurrences(of: " ", with: "")
        //Check if two non-number characters exist
        let digits = CharacterSet.decimalDigits
        var NaN = false
        for uni in value.unicodeScalars {
            if !digits.contains(uni) {
                if NaN == true {
                    return false
                }
                NaN = true
            }
            else {
                NaN = false
            }
        }
        return true
    }
    
}
