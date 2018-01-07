//
//  Utils.swift
//  Assignment 1 - Set
//
//  Created by Charles Hennessey  on 1/7/18.
//  Copyright © 2018 Charles Hennessey . All rights reserved.
//

import Foundation

class Utils{
    // concatenate attributed strings
    func concatStrings(left: NSAttributedString, right: NSAttributedString) -> NSAttributedString
    {
        let result = NSMutableAttributedString()
        result.append(left)
        result.append(right)
        return result
    }
}
