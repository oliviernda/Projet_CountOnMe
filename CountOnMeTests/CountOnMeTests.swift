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
        calculator.tappedAddition()
        calculator.tappedNumber(numberText: "1")
        calculator.tappedEqual()
        XCTAssertEqual(calculator.calculString, "1 + 1 = 2")
    }
    
    
    
    func testGivenSubstractionMethod_WhenAnOperatorIsAlreadyTapped_ThenShouldNotAddSubstractionToCalculString() {
        calculator.tappedNumber(numberText: "4")
        calculator.tappedAddition()
        calculator.tappedSubstraction()
        XCTAssertEqual(calculator.calculString, "4 + ")
    
    }
    
    func testGivenAdditionMethod_WhenAnOperatorIsAlreadyTapped_ThenShouldNotAddSubstractionToCalculString() {
           calculator.tappedNumber(numberText: "4")
           calculator.tappedAddition()
           calculator.tappedAddition()
           XCTAssertEqual(calculator.calculString, "4 + ")
       
       }
    
    func testGivenSubstractionMethod_WhenCorrectCalculIsPassed_ThenShouldReturnCorrectresult() {
        calculator.tappedNumber(numberText: "5")
        calculator.tappedSubstraction()
        calculator.tappedNumber(numberText: "2")
        calculator.tappedEqual()
        XCTAssertEqual(calculator.calculString, "5 - 2 = 3")
    }
    
    func testGivenTappedNumberMethod_WhenExpressionHaveresult_ThenShouldReturnCorrectresult() {
        calculator.tappedNumber(numberText: "1")
        calculator.tappedAddition()
        calculator.tappedNumber(numberText: "1")
        calculator.tappedEqual()
        calculator.tappedNumber(numberText: "1")
        XCTAssertEqual(calculator.calculString, "1")
        
    }
    
    
    func testGivenTappedEqualMethod_WhenWrongOparationIspassed_ThenShouldNotCalculate(){
        calculator.tappedNumber(numberText: "1")
        calculator.tappedSubstraction()
        calculator.tappedEqual()
        XCTAssertEqual(calculator.calculString, "1 - ")

    }
    
    func testGiventappedEqualMethod_WhenNoneOperatorIstapped_ThenShouldNotcalculate(){
        calculator.tappedNumber(numberText: "2")
        calculator.tappedEqual()
        XCTAssertEqual(calculator.calculString, "2")
    }
    
}

