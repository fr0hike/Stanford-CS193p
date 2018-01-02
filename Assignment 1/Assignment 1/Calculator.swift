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

import Foundation

struct Calculator {
    
    
    func comput(value : String) -> String?  {
        let newString = value.replacingOccurrences(of: "x", with: "*", options: .literal, range: nil)
        let mathExpression = NSExpression(format: newString)
        let mathValue = mathExpression.expressionValue(with: nil, context: nil) as? Double
        return String(describing: mathValue!)
    }
    
}
