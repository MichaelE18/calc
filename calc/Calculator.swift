//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    func add(no1: Int, no2: Int) -> Int {   //Addition function
        return no1 + no2;
    }
    
    func minus(no1: Int, no2: Int) -> Int { //Subtraction function
        return no1 - no2;
    }
    
    func multiply(no1: Int, no2: Int) -> Int {  //Multiplication function
        return no1 * no2;
    }
    
    func divide(no1: Int, no2: Int) -> Int {    //Division function
        return no1 / no2;
    }
    
    func modulus(no1: Int, no2: Int) -> Int {   //Modulus function
        return no1 % no2;
    }

    
    func calculate(args: [String]) -> String {  //Main calculate function
        guard args.count >= 3 else {
            return "Error: Invalid number format."
        }
        
        var numbers: [Int] = []             //Seperates number into an array
        var operators: [String] = []        //Seperates operators into an array
        
        for (index, arg) in args.enumerated() {
            if index % 2 == 0 {             //If even placement in args its a number
                guard let num = Int(arg) else {
                    return "Error: Invalid number format."
                }
                numbers.append(num)
            } else {
                operators.append(arg)       //If odd placement in args its an operator
            }
        }
        
        var i = 0
        while i < operators.count {
            if operators[i] == "x" {        //Iterates through checking which operator
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
        return String(numbers[0])       //Returns the result
    }
}
