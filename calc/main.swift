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

// Retrieve User Input
//let no1 = Int(args[0]); // Sample Code Only! Update Required!
//let operatar = args[1]; // Sample Code Only! Update Required!
//let no2 = Int(args[2]); // Sample Code Only! Update Required!
var no1: Int?
var no2: Int?
var operatar = args[1]

//if args.count >= 3 {
    // Convert the arguments (strings) to integers
if operatar  == "+" {
    if let n1 = Int(args[0]), let n2 = Int(args[2]) {
        no1 = n1
        no2 = n2
        operatar = args[1] // Store the operator (it's not used in this code, but you can extend it later)
        
        // Initialize a Calculator object
        let calculator = Calculator()
        
        if let no1 = no1, let no2 = no2 {
            let result = calculator.add(no1: no1, no2: no2)
            
            // Print the result
            print(result)
        }
    }
}
//}


// Initialize a Calculator object
//let calculator = Calculator();

// Calculate the result
//let result = calculator.add(no1: no1, no2: no2);

//print(result)
print("hello")
