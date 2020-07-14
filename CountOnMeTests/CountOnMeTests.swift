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
    
    
    
    func testGivenTapeSubstractionAfterAdditionTappedMethod_WhenAnOperatorIsAlreadyTapped_ThenShouldNotAddSubstractionToCalculString() {
        calculator.tappedNumber(numberText: "4")
        calculator.tappedOperator(mathOperator: "+")
        calculator.tappedOperator(mathOperator: "-")
        XCTAssertEqual(calculator.calculString, "4 + ")
    
    }
    
    func testGivenTapeAdditionTwoTimes_WhenAnOperatorIsAlreadyTapped_ThenShouldNotAddAdditionToCalculString() {
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
    
    
    func testGivenTappedNumberAfterEqualMethod_WhenWrongButtonIsPressed_ThenShouldDisplayAlert() {
        calculator.tappedNumber(numberText: "1")
        calculator.tappedOperator(mathOperator: "+")
        calculator.tappedNumber(numberText: "1")
        calculator.tappedEqual()
        calculator.tappedNumber(numberText: "1")
        XCTAssertEqual(calculator.calculString, "1")
        
    }
    
    
    func testGivenTappedEqualAfterAnOperatorMethod_WhenPresseEqualAfterAnOperator_ThenShouldNotCalculate(){
        calculator.tappedNumber(numberText: "1")
        calculator.tappedOperator(mathOperator: "-")
        calculator.tappedEqual()
        XCTAssertEqual(calculator.calculString, "1 - ")

    }
    
    
    func testGivenNoneOperatorTappedBeforeEqualTappedMethod_WhenNoneOperatorIstapped_ThenShouldNotcalculate(){
        calculator.tappedNumber(numberText: "2")
        calculator.tappedEqual()
        XCTAssertEqual(calculator.calculString, "2")
    }
    
    
    
    func testGivenCalculationBeginBySubstraction_WhenSubstrationPressedBeforeAnOperator_ThenShouldReturnCorrectresult() {
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

    
    
    func testGivenTappedAnOperatorAfterResult_WhenExpressionHaveResult_ThenShouldNotAddOperator() {
           calculator.tappedNumber(numberText: "2")
           calculator.tappedOperator(mathOperator: "-")
           calculator.tappedNumber(numberText: "1")
           calculator.tappedEqual()
           calculator.tappedOperator(mathOperator: "+")
           XCTAssertEqual(calculator.calculString, "2 - 1 = 1 + ")
           
       }
    
    
    
    func testGivenMultiplicationPriotityCalculMethod_WhenCalculationContainsMultiplicationOperator_ThenShouldDoMultiplicationOperationFirst() {
              calculator.tappedNumber(numberText: "5")
              calculator.tappedOperator(mathOperator: "+")
              calculator.tappedNumber(numberText: "2")
              calculator.tappedOperator(mathOperator: "*")
              calculator.tappedNumber(numberText: "2")
              calculator.tappedEqual()
              XCTAssertEqual(calculator.calculString, "5 + 2 * 2 = 9")
              
          }
    
    
    func testGivenDivisionPriotityCalculMethod_WhenCalculationContainsDivisionOperator_ThenShouldDoDivisionOperationFirst() {
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

