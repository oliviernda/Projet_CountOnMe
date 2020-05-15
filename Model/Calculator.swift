//
//  Calculator.swift
//  CountOnMe
//
//  Created by Nda Kwadzo Olivier on 08/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

protocol CalculatorHandler {
    func displayScreen(calculText: String)
    func displayAlert(message: String)
    
}

class Calculator {
    
    var calculatorHandlerDelegate: CalculatorHandler?
    
    var calculString = "" {
        didSet {
            calculatorHandlerDelegate?.displayScreen(calculText: calculString)
        }
        
    }
    
    var elements: [String] {
        return calculString.split(separator: " ").map { "\($0)" }
    }
    
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-"
    }
    
    var expressionHaveResult: Bool {
        return calculString.firstIndex(of: "=") != nil
    }
    
    
    
    func tappedNumber(numberText: String) {
        if expressionHaveResult {
            calculString = ""
        }
        calculString.append(numberText)
    }
    
    
    
    func tappedAddition() {
        if canAddOperator {
            calculString.append(" + ")
        } else {
            calculatorHandlerDelegate?.displayAlert(message: "Un operateur est déja mis !")
        }
    }
    
    
    
    func tappedSubstraction() {
        if canAddOperator {
            calculString.append(" - ")
        } else {
            calculatorHandlerDelegate?.displayAlert(message: "Un operateur est déja mis !")
            
        }
    }
    
    
    func tappedEqual() {
        guard expressionIsCorrect else {
            calculatorHandlerDelegate?.displayAlert(message: "Entrez une expression correcte !")

            return
        }
        
        guard expressionHaveEnoughElement else {
            calculatorHandlerDelegate?.displayAlert(message: "Démarrez un nouveau calcul !")

            return
        }
        
        // Create local copy of operations
        var operationsToReduce = elements
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!
            
            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            default: fatalError("Unknown operator !")
            }
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        
        calculString.append(" = \(operationsToReduce.first!)")
        
    }
    
    
    
}


