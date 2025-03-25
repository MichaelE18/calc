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
//    var currentResult = 0;
    
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
        guard args.count >= 3 else {
            return "Error: Invalid number format."
        }
        
//        var currentResult = firstNum
//        var i = 1
        
//    while i < args.count - 1 {
//        let oper = args[i]
//        guard let nextNum = Int(args[i + 1]) else {
//            return "Error: Invalid number format."
//        }
//
//        switch oper {
//            case "+":
//                currentResult = add(no1: currentResult, no2: nextNum)
//            case "-":
//                currentResult = minus(no1: currentResult, no2: nextNum)
//            case "x":
//                currentResult = multiply(no1: currentResult, no2: nextNum)
//            case "/":
//                currentResult = divide(no1: currentResult, no2: nextNum)
//            case "%":
//                currentResult = modulus(no1: currentResult, no2: nextNum)
//            default:
//                return "Error: Unsupported operator \(oper)."
//            }
//
//            i += 2  // Move to the next operator
//        }
//        return String(currentResult)
        
        var numbers: [Int] = []
        var operators: [String] = []
        
        for (index, arg) in args.enumerated() {
            if index % 2 == 0 {
                guard let num = Int(arg) else {
                    return "Error: Invalid number format."
                }
                numbers.append(num)
            } else {
                operators.append(arg)
            }
        }
        
        var i = 0
        while i < operators.count {
            if operators[i] == "x" {
                numbers[i] = multiply(no1: numbers[i], no2: numbers[i + 1])
                numbers.remove(at: i + 1)
                operators.remove(at: i)
            } else if operators[i] == "/" {
                if numbers[i + 1] == 0 {
                    return "Error: Division by zero."
                }
                numbers[i] = divide(no1: numbers[i], no2: numbers[i + 1])
                numbers.remove(at: i + 1)
                operators.remove(at: i)
            } else if operators[i] == "%" {
                numbers[i] = modulus(no1: numbers[i], no2: numbers[i + 1])
                numbers.remove(at: i + 1)
                operators.remove(at: i)
            } else {
                i += 1
            }
        }
        
        i = 0
        while i < operators.count {
            if operators[i] == "+" {
                numbers[i] = add(no1: numbers[i], no2: numbers[i + 1])
            } else if operators[i] == "-" {
                numbers[i] = minus(no1: numbers[i], no2: numbers[i + 1])
            }
            numbers.remove(at: i + 1)
            operators.remove(at: i)
        }
        return String(numbers[0])
    }
}
