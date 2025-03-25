//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//
//swiftc -o calc main.swift Calculator.swift
//create executable

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

if args.count >= 3 {
    // Initialize a Calculator object
    let calculator = Calculator()
    
    // Call the calculate function and pass the arguments
    let result = calculator.calculate(args: args)
    
    // Print the result returned from the calculate function
    print(result)
} else {
    print("Invalid input. Please provide at least two numbers and an operator.")
}
