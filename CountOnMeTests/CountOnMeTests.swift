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
}
