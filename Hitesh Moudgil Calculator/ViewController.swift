//
//  ViewController.swift
//  Hitesh Moudgil Calculator
//
//  Created by Hitesh Moudgil on 2023-05-18.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var numberDisplay: UITextField!
    
    //MARK:- Other variables
    var calculatorModel = HiteshCalculatorModel()
    var startNewNumber = true
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: IBActions
    @IBAction func buttonTouched(_ sender: UIButton) {
        print("button touched")
        print(sender.currentTitle!)
        
        let buttonText = sender.currentTitle!
        
        var currentValue = numberDisplay.text!
       
        switch(buttonText){
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".":
            //do something
            if(startNewNumber){
                if(buttonText == "."){
                   currentValue = "0."
                } else {
                    currentValue = buttonText
                }
            } else {
                if(buttonText == "."){
                    if(currentValue.contains(".")){
                        //do nothing
                    }
                    else {
                        currentValue = currentValue + buttonText
                    }
                } else{
                    currentValue = currentValue + buttonText
                }
            }
            startNewNumber = false
            calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            
        case "+", "-", "*", "/":
            if(calculatorModel.secondNumber != nil){
                currentValue = String(calculatorModel.getResult())
                calculatorModel.reset()
                calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            }
            calculatorModel.operation = buttonText
            startNewNumber = true
            //accept secondNumber after this
            
        case "=":
            //get the result and display it
            if(calculatorModel.secondNumber == nil){
                calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            }
            currentValue = String(calculatorModel.getResult())
            startNewNumber = true
            
        case "C":
            currentValue = "0"
            calculatorModel.reset()
            startNewNumber = true
            
        default:
            //do something by default
            print(buttonText)
        }
        
        numberDisplay.text = currentValue
    }
}

