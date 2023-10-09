//
//  MathOperationLogic.swift
//  Calculator
//
//  Created by Hovo Ohanyan on 08.08.23.
//

import Foundation
import UIKit


final class MathOperationLogicManager {
    var mathOperation = MathOperationStruct()
    var delegate: SendCalculatorText!
    private(set) var calculatorText: String = "" 
    
    private var isDoubleNumber = false
    
    public func acButtonTapped()  {
        self.mathOperation.operation = .none
        self.mathOperation.firstInput = ""
        self.mathOperation.result = ""
        isDoubleNumber = false
        calculatorText = "0" 
    }
    
    public func numberButtonTaped(with button: Int) {
        if calculatorText == "0" {
            calculatorText = String(button)
        } else {
            calculatorText += String(button)
        }
    }
    
    public func plusButtonTapped() {
        self.mathOperation.firstInput = calculatorText
        self.mathOperation.operation = .plus
        isDoubleNumber = false
        
        calculatorText = "0"
        
    }
    
    
    public func minusButtonTapped() {
        self.mathOperation.firstInput = calculatorText
        self.mathOperation.operation = .minus
        isDoubleNumber = false
        calculatorText = "0"
        
    }
    
    public func multipleButtonTapped() {
        if self.mathOperation.operation == .none {
            
            self.mathOperation.firstInput = calculatorText
            self.mathOperation.operation = .multiple
            isDoubleNumber = false
            
            calculatorText = "0"
        }
    }
    
    public func divisonButtonTapped() {
        self.mathOperation.firstInput = calculatorText
        self.mathOperation.operation = .divison
        isDoubleNumber = false
        
        calculatorText = "0"
        
    }
    
    public func plusMinusButtonTapped() {
        let currentNumber = Decimal(string: calculatorText)!
        
        calculatorText = String(describing: currentNumber - (currentNumber * 2))
    }
    
    public func percentButtonTapped() {
        let currentNumber = Decimal(string: calculatorText)!
        
        calculatorText = String(describing: currentNumber / 100)
    }
    
    public func dotButtonTaped() {
        if !isDoubleNumber {
            calculatorText += "."
            isDoubleNumber = true
        }
    }
    
    public func equalButtonTapped() {
        switch self.mathOperation.operation {
        case .plus:
            let firstNumber = Decimal(string: mathOperation.firstInput)!
            let secondNumber = Decimal(string: calculatorText)!
            
            calculatorText = String(describing: firstNumber + secondNumber)
            
        case .minus:
            let firstNumber = Decimal(string: mathOperation.firstInput)!
            let secondNumber = Decimal(string: calculatorText)!
            
            calculatorText = String(describing: firstNumber - secondNumber)
            
        case .divison:
            if !isDoubleNumber {
                let firstNumber = Int(mathOperation.firstInput)!
                let secondNumber = Int(calculatorText)!
                
                
                if firstNumber % secondNumber != 0 {
                    let number = Double(mathOperation.firstInput)!
                    let otherNumber = Double(calculatorText)!
                    
                    mathOperation.result = String(number / otherNumber)
                   
                } else {
                    let firstNumber = Decimal(string: mathOperation.firstInput)!
                    let secondNumber = Decimal(string: calculatorText)!
                    
                    mathOperation.result = String(describing: firstNumber / secondNumber)
                    
                }
                
                calculatorText = mathOperation.result
            } else {
                let firstNumber = Double(mathOperation.firstInput)!
                let secondNumber = Double(calculatorText)!
                
                mathOperation.result = String(firstNumber / secondNumber)
                calculatorText = mathOperation.result
            }
        case .multiple:
            if !isDoubleNumber {
                let firstNumber = Int(mathOperation.firstInput)!
                let secondNumber = Int(calculatorText)!
                
                mathOperation.result = String(firstNumber * secondNumber)
                calculatorText = mathOperation.result
            } else {
                let firstNumber = Decimal(string: mathOperation.firstInput)!
                let secondNumber = Decimal(string: calculatorText)!
                
                mathOperation.result = String(describing: firstNumber * secondNumber)
                calculatorText = mathOperation.result
                
            }
        case .none:
            break
        }
    }
    
    public func swipeAction() {
        if calculatorText.count > 0 && calculatorText != "0" {
            calculatorText.removeLast()
            
            if calculatorText.isEmpty {
                calculatorText = "0"
            }
        }
    }
}


