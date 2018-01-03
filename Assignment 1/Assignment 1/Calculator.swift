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
    
    var oldResult = "" 
    
   
    // Base Method
    mutating func comput(value : String) -> String?  {
        print(oldResult)
        let expression = extractBaseExpression(val: value)
        var parsedExpression : String
        
        if oldResult.count > 1 && !isValidExpression(expression: value){ //Ex: 81 + 4
            if value.contains("cos") { //Edge Case
                oldResult = String(cos(Double(getResult(value: expression))!))
                return oldResult
            }
            oldResult = getResult(value: oldResult + expression)
            return oldResult
        }
        if value.contains("sqrt") {
            parsedExpression = "sqrt(" + expression + ")"
            oldResult = getResult(value : parsedExpression)
        }
        else if value.contains("cos") {
            oldResult = String(cos(Double(getResult(value: expression))!))
        }
        else if value.contains("sqr"){
            parsedExpression = expression + "*" + expression
            oldResult = getResult(value : parsedExpression)
        }
        else if value.contains("a⁻¹"){
            let base = Double(expression)!
            print(base)
            oldResult = String(pow(base, -1.0))
            print(expression)
            return oldResult
        }
        else {
            oldResult = getResult(value: expression)
        }
        return oldResult
        
    }
    //Helpers
    private func extractBaseExpression(val : String) -> String {
        return val.replacingOccurrences(of: "a⁻¹", with: "")
                    .replacingOccurrences(of: "sqrt", with: "")
                    .replacingOccurrences(of: "cos", with: "")
                    .replacingOccurrences(of: " ", with: "")
                    .replacingOccurrences(of: "x", with: "*", options: .literal, range: nil)
                    .replacingOccurrences(of: "sqr", with: "")
    }
    
    private func getResult(value : String) -> String {
        if !isValidExpression(expression: value){
            return "error in syntax: " + value
        }
        let mathExpression = NSExpression(format: value)
        let mathValue = mathExpression.expressionValue(with: nil, context: nil) as? Double
        return String(describing: mathValue!)
    }
    func isValidExpression(expression : String) -> Bool {
        print(expression)
        if expression.contains("sqrt"){
            return true
        }
        else if expression.count < 3 {
            return false
        }
        else if expression.contains("e"){
            return false
        }
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
