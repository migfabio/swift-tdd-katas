//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Fabio Mignogna on 31/08/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import XCTest
import StringCalculator

class StringCalculatorTests: XCTestCase {
    
    private let sut = StringCalculator()
    
    func test_add_whenInputIsEmptyString_shouldReturnZero() {
        XCTAssertEqual(try! sut.add(""), 0)
        XCTAssertEqual(try! sut.add("  "), 0)
    }
    
    func test_add_whenInputIsSingleNumber_shouldReturnValue() {
        XCTAssertEqual(try! sut.add("1"), 1)
        XCTAssertEqual(try! sut.add("2"), 2)
        XCTAssertEqual(try! sut.add("3   "), 3)
    }
    
    func test_add_whenInputIsTwoNumberCommaDelimited_shouldReturnSum() {
        XCTAssertEqual(try! sut.add("1,2"), 3)
        XCTAssertEqual(try! sut.add("2  ,  3"), 5)
    }
    
    func test_add_whenInputIsTwoNumberNewLineDelimited_shouldReturnSum() {
        XCTAssertEqual(try! sut.add("1\n2"), 3)
        XCTAssertEqual(try! sut.add("1  \n  2"), 3)
    }
    
    func test_add_whenInputIsThreeNumberDelimitedEitherWay_shouldReturnSum() {
        XCTAssertEqual(try! sut.add("1\n2,3\n4"), 10)
        XCTAssertEqual(try! sut.add(" 1 \n 2 , 3 \n 4 "), 10)
    }
        
    func test_add_whenInputAreNegativeNumbers_shouldThrowNonNegativeNumberError() {
        XCTAssertThrowsError(try sut.add("-1,2,-3")) { (error) in
            guard case StringCalculatorError.nonNegativeNumber(let values) = error else {
                return XCTFail("StringCalculator does not throw an error for negative numbers")
            }

            XCTAssertEqual(values, [-1, -3])
            XCTAssertEqual(error.localizedDescription, "Negatives not allowed: -1,-3")
        }
    }
    
    func test_add_whenInputContainsNumbersGreaterThan1000_shouldIgnoreThem() {
        XCTAssertEqual(try! sut.add("1,1000,1001"), 1001)
    }
    
    func test_add_whenSingleCharDelimiterIsDefinedAtFirstLineStartingWithDoubleSlash_shouldBeUsedItToReturnSum() {
        XCTAssertEqual(try! sut.add("//#\n1#2"), 3)
    }
    
    func test_add_whenInvalidInput_shouldThrowInvalidInputError() {
        XCTAssertThrowsError(try sut.add("1,\n")) { (error) in
            guard case StringCalculatorError.invalidInput = error else {
                return XCTFail("StringCalculator does not throw an error for invalid input")
            }

            XCTAssertEqual(error.localizedDescription, "Invalid input")
        }
    }
    
    func test_add_whenMultipleCharDelimiterIsDefinedAtFirstLineStartingWithDoubleSlash_shouldBeUsedItToReturnSum() {
        XCTAssertEqual(try! sut.add("//###\n1###2"), 3)
    }
}
