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
        var elements = calculString.split(separator: " ").map { "\($0)" }
        if elements.first == "-" {
            elements[1] = "-\(elements[1])"
            elements.removeFirst()
        }
        return elements
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
    
    var expressionContainsDivisionByZero: Bool {
        return calculString.contains("/ 0")
    }
    
    func tappedNumber(numberText: String) {
        if expressionHaveResult {
            calculString = ""
        }
        calculString.append(numberText)
    }
    
    
    
    
    func tappedReset() {
        calculString = ""
    }
    
    
    func tappedOperator(mathOperator: String) {
        if expressionHaveResult {
            calculatorHandlerDelegate?.displayAlert(message: "Vous ne pouvez pas ajouter d'opérateur !")

        }
        if (expressionIsCorrect && canAddOperator && !calculString.isEmpty) || (calculString.isEmpty && mathOperator == "-") {
            calculString.append(" \(mathOperator) ")
        } else {
            calculatorHandlerDelegate?.displayAlert(message: "Un operateur est déja mis !")
        }
    }
    
    
    
    
    

    
    func priority(expression: [String]) -> [String] {
        var tempExpression: [String] = expression
        while tempExpression.contains("*") || tempExpression.contains("/") {
            if let index = tempExpression.firstIndex(where: { $0 == "*" || $0 == "/"}) {
                let mathOperator = tempExpression[index]
                guard let leftNumber = Double(tempExpression[index-1]) else { return []}
                guard let rigthNumber = Double(tempExpression[index+1]) else { return []}
                let result : Double
                if mathOperator == "*" {
                    result = leftNumber*rigthNumber
                } else {
                    result = leftNumber/rigthNumber
                }
            
                tempExpression[index-1] = String(result)
                tempExpression.remove(at: index+1)
                tempExpression.remove(at: index)
            }
            
        }
    
        
        return tempExpression
    }
    
    
    
    
    
    func formatResult(result: Double) -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 3
        formatter.minimumFractionDigits = 0
        guard let resultFormated = formatter.string(from: NSNumber(value: result)) else { return ""}
        return resultFormated
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
        
        guard !expressionContainsDivisionByZero else {
            calculatorHandlerDelegate?.displayAlert(message: "Il est impossible de diviser par zéro !")

            return
        }
        
        // Create local copy of operations
        var operationsToReduce = priority(expression: elements)
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            guard let left = Double(operationsToReduce[0]) else { return }
            let operand = operationsToReduce[1]
            guard let right = Double(operationsToReduce[2]) else { return }
            
            let result: Double
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
                
                
 
                
            default: return
            }
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        
        guard let result = operationsToReduce.first else { return }
        guard let resultDoubled = Double(result) else { return }
        let resultFormated = formatResult(result: resultDoubled)
        calculString.append(" = \(resultFormated)")
        
    }
    
    
    
}


