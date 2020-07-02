//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Nda Kwadzo Olivier on 04/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeTests: XCTestCase {

    var calculator: Calculator!
    
 
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }

    func testGivenAdditionMethod_WhenCorrectCalculIsPassed_ThenShouldReturnCorrectResult() {
        calculator.tappedNumber(numberText: "1")
        calculator.tappedOperator(mathOperator: "+")
        calculator.tappedNumber(numberText: "1")
        calculator.tappedEqual()
        XCTAssertEqual(calculator.calculString, "1 + 1 = 2")
    }
    
    
    
    func testGivenSubstractionMethod_WhenAnOperatorIsAlreadyTapped_ThenShouldNotAddSubstractionToCalculString() {
        calculator.tappedNumber(numberText: "4")
        calculator.tappedOperator(mathOperator: "+")
        calculator.tappedOperator(mathOperator: "-")
        XCTAssertEqual(calculator.calculString, "4 + ")
    
    }
    
    func testGivenAdditionMethod_WhenAnOperatorIsAlreadyTapped_ThenShouldNotAddSubstractionToCalculString() {
           calculator.tappedNumber(numberText: "4")
           calculator.tappedOperator(mathOperator: "+")
           calculator.tappedOperator(mathOperator: "+")
           XCTAssertEqual(calculator.calculString, "4 + ")
       
       }
    
    func testGivenSubstractionMethod_WhenCorrectCalculIsPassed_ThenShouldReturnCorrectresult() {
        calculator.tappedNumber(numberText: "5")
        calculator.tappedOperator(mathOperator: "-")
        calculator.tappedNumber(numberText: "2")
        calculator.tappedEqual()
        XCTAssertEqual(calculator.calculString, "5 - 2 = 3")
    }
    
    func testGivenTappedNumberMethod_WhenExpressionHaveresult_ThenShouldReturnCorrectresult() {
        calculator.tappedNumber(numberText: "1")
        calculator.tappedOperator(mathOperator: "+")
        calculator.tappedNumber(numberText: "1")
        calculator.tappedEqual()
        calculator.tappedNumber(numberText: "1")
        XCTAssertEqual(calculator.calculString, "1")
        
    }
    
    
    func testGivenTappedEqualMethod_WhenWrongOparationIspassed_ThenShouldNotCalculate(){
        calculator.tappedNumber(numberText: "1")
        calculator.tappedOperator(mathOperator: "-")
        calculator.tappedEqual()
        XCTAssertEqual(calculator.calculString, "1 - ")

    }
    
    func testGiventappedEqualMethod_WhenNoneOperatorIstapped_ThenShouldNotcalculate(){
        calculator.tappedNumber(numberText: "2")
        calculator.tappedEqual()
        XCTAssertEqual(calculator.calculString, "2")
    }
    
    
    
    
    
    
    
    func testGivenTappedDot_WhenExpressionHaveresult_ThenShouldReturnCorrectresult() {
           calculator.tappedOperator(mathOperator: "-")
           calculator.tappedNumber(numberText: "1")
           calculator.tappedOperator(mathOperator: "+")
           calculator.tappedNumber(numberText: "2")
           calculator.tappedEqual()
           XCTAssertEqual(calculator.calculString, " - 1 + 2 = 1")
    
}

    func testGivenTappedResetMethod_WhenPressedResetButton_ThenShouldResetCalculString(){
      calculator.tappedReset()
      XCTAssertEqual(calculator.calculString, "")
  }

    
    func testGivenAddOperatorMethod_WhenExpressionHaveresult_ThenShouldNotAddOperator() {
           calculator.tappedNumber(numberText: "2")
           calculator.tappedOperator(mathOperator: "-")
           calculator.tappedNumber(numberText: "1")
           calculator.tappedEqual()
           calculator.tappedOperator(mathOperator: "+")
           XCTAssertEqual(calculator.calculString, "2 - 1 = 1 + ")
           
       }
    
    
    
    func testGivenMultiplicationPriotityCalculMethod_WhenExpressionHaveresult_ThenShould() {
              calculator.tappedNumber(numberText: "5")
              calculator.tappedOperator(mathOperator: "+")
              calculator.tappedNumber(numberText: "2")
              calculator.tappedOperator(mathOperator: "*")
              calculator.tappedNumber(numberText: "2")
              calculator.tappedEqual()
              XCTAssertEqual(calculator.calculString, "5 + 2 * 2 = 9")
              
          }
    
    
    func testGivenDivisionPriotityCalculMethod_WhenExpressionHaveresult_ThenShould() {
                 calculator.tappedNumber(numberText: "6")
                 calculator.tappedOperator(mathOperator: "-")
                 calculator.tappedNumber(numberText: "9")
                 calculator.tappedOperator(mathOperator: "/")
                 calculator.tappedNumber(numberText: "3")
                 calculator.tappedEqual()
                 XCTAssertEqual(calculator.calculString, "6 - 9 / 3 = 3")
                 
   }

    func testGivenExpressionContainsDivisionByZero_WhenExpressionHaveDivisionByZero_ThenCalculationShouldFailed() {
                  calculator.tappedNumber(numberText: "6")
                  calculator.tappedOperator(mathOperator: "-")
                  calculator.tappedNumber(numberText: "9")
                  calculator.tappedOperator(mathOperator: "/")
                  calculator.tappedNumber(numberText: "0")
                  calculator.tappedEqual()
                  XCTAssertEqual(calculator.calculString, "6 - 9 / 0")
                  
    }

    
}

