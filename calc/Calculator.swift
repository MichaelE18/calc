//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    /// For multi-step calculation, it's helpful to persist existing result
    var currentResult = 0;
    
    /// Perform Addition
    ///
    /// - Author: Jacktator
    /// - Parameters:
    ///   - no1: First number
    ///   - no2: Second number
    /// - Returns: The addition result
    ///
    /// - Warning: The result may yield Int overflow.
    /// - SeeAlso: https://developer.apple.com/documentation/swift/int/2884663-addingreportingoverflow
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
    
    func minus(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
    
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
    
    func divide(no1: Int, no2: Int) -> Int {
        return no1 / no2;
    }
    
    func modulus(no1: Int, no2: Int) -> Int {
        return no1 % no2;
    }

    
    func calculate(args: [String]) -> String {
        // Todo: Calculate Result from the arguments. Replace dummyResult with your actual result;
        //        let dummyResult = add(no1: 1, no2: 2);
        //
        //        let result = String(dummyResult);
        //        return(result)
        
        let no1 = Int(args[0]) // First number
        let operatar = args[1] // Operator (e.g., "+")
        let no2 = Int(args[2]) // Second number
        
        if let num1 = no1, let num2 = no2 {
            switch operatar {
            case "+":
                return String(add(no1: num1, no2: num2)) // Calls add() method
            case "-":
                return String(minus(no1: num1, no2: num2)) // Calls minus() method
            case "x":
                return String(multiply(no1: num1, no2: num2)) // Calls multiply() method
            case "/":
                if num2 != 0 {
                    return String(divide(no1: num1, no2: num2)) // Calls divide() method
                } else {
                    return "Error: Division by zero is not allowed."
                }
            case "%":
                return String(modulus(no1: num1, no2: num2)) // Calls modulus() method
            default:
                return "Error: Unsupported operator."
            }
        } else {
            return "Error: Invalid number format."
        }
    }
}
