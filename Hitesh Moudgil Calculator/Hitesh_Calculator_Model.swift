//
//  Hitesh_Calculator_Model.swift
//  Hitesh Moudgil Calculator
//
//  Created by Hitesh Moudgil on 2023-05-22.
//

import Foundation

class HiteshCalculatorModel {
    var firstNumber: Double?
    var secondNumber: Double?
    var operation: String?
    
    func updateNumber(newNumber: Double){
        if(firstNumber == nil){
            firstNumber = newNumber
        } else if(operation == nil){
            firstNumber = newNumber
        } else{
            secondNumber = newNumber
        }
    }
    
    func getResult () -> Double{
        var result: Double
        
        switch(operation){
        case "+":
            result = firstNumber! + secondNumber!
        case "-":
            result = firstNumber! - secondNumber!
        case "*":
            result = firstNumber! * secondNumber!
        case "/":
            result = firstNumber! / secondNumber!
        default:
            result = 0.0
        }
        
        return result
    }
    
    func reset(){
        firstNumber = nil
        secondNumber = nil
        operation = nil
    }
}
