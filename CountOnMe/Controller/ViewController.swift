//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private var numberButtons: [UIButton]!
    
    // MARK: - PROPERTIES
    
    private let calculator = Calculator()
    
    // MARK: - VIEW LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculator.calculatorHandlerDelegate = self 
    }
    
    // MARK: - ACTIONS
    
    // View actions
    @IBAction private func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        calculator.tappedNumber(numberText: numberText)
    }
    
    @IBAction private func tappedResetButton(_ sender: UIButton) {
        calculator.tappedReset()
    }
    
    @IBAction private func tappedOperatorButtons(_ sender: UIButton) {
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
    
    @IBAction private func tappedEqualButton(_ sender: UIButton) {
        calculator.tappedEqual()
    }
}

// MARK: - EXTENSION

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

