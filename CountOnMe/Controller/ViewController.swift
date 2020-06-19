//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    
    
    
    
    
    
    
    
    
    let calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculator.calculatorHandlerDelegate = self 
    }
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        calculator.tappedNumber(numberText: numberText)
    }
    
    
    
    

    
    @IBAction func tappedResetButton(_ sender: UIButton) {
    
   
        calculator.tappedReset()
}

    
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        guard let mathOperator = sender.title(for: .normal) else { return }
        switch mathOperator {
        case "+":
            calculator.tappedOperator(mathOperator: "+")
            case "-":
            calculator.tappedOperator(mathOperator: "-")
            case "✕":
            calculator.tappedOperator(mathOperator: "*")
            case "÷":
            calculator.tappedOperator(mathOperator: "/")
        default:
            break
        }
        
     
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        
        
        guard let mathOperator = sender.title(for: .normal) else { return }
        switch mathOperator {
        case "+":
            calculator.tappedOperator(mathOperator: "+")
            case "-":
            calculator.tappedOperator(mathOperator: "-")
            case "✕":
            calculator.tappedOperator(mathOperator: "*")
            case "÷":
            calculator.tappedOperator(mathOperator: "/")
        default:
            break
        }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        
        
        calculator.tappedEqual()
    }
    
    
    
    
    
    
    
    @IBAction func tappedDivisonButton(_ sender: UIButton) {
   
        guard let mathOperator = sender.title(for: .normal) else { return }
        switch mathOperator {
        case "+":
            calculator.tappedOperator(mathOperator: "+")
            case "-":
            calculator.tappedOperator(mathOperator: "-")
            case "✕":
            calculator.tappedOperator(mathOperator: "*")
            case "÷":
            calculator.tappedOperator(mathOperator: "/")
        default:
            break
        }
        
    }
    
   
    
    
    
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        
        guard let mathOperator = sender.title(for: .normal) else { return }
        switch mathOperator {
        case "+":
            calculator.tappedOperator(mathOperator: "+")
            case "-":
            calculator.tappedOperator(mathOperator: "-")
            case "✕":
            calculator.tappedOperator(mathOperator: "*")
            case "÷":
            calculator.tappedOperator(mathOperator: "/")
        default:
            break
        }
    }
    

    
    
    
}

extension ViewController: CalculatorHandler {
    func displayAlert(message: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    func displayScreen(calculText: String) {
        textView.text = calculText
    }
    
    
}

