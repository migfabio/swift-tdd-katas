//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Fabio Mignogna on 31/08/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import XCTest

enum StringCalculatorError: Error, LocalizedError {
    case nonNegativeNumber(numbers: [Int])
    
    var errorDescription: String? {
        switch self {
        case .nonNegativeNumber(let numbers):
            return "Negatives not allowed: \(numbers.map { String($0) }.joined(separator: ","))"
        }
    }
}

class StringCalculator {
    
    func add(_ input: String) throws -> Int {
        var separator = ","
        if input.hasPrefix("//") {
            separator = String(input[input.index(input.startIndex, offsetBy: 2)])
        }
        
        let stringValues: [Substring] = input.split {
            String($0) == separator || String($0) == "\n"
        }
        
        let intValues: [Int] = stringValues.compactMap {
            let value = Int($0.trimmingCharacters(in: .whitespaces)) ?? 0
            return value <= 1000 ? value : nil
        }
        
        let negativeNumbers = intValues.filter({ $0 < 0 })
        
        guard negativeNumbers.isEmpty else {
            throw StringCalculatorError.nonNegativeNumber(numbers: negativeNumbers)
        }
        
        return intValues.reduce(0, +)
    }
}

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
        
    func test_add_whenInputAreNegativeNumbers_shouldThrownNonNegativeNumberException() {
        XCTAssertThrowsError(try sut.add("-1,2,-3")) { (error) in
            guard case StringCalculatorError.nonNegativeNumber(let values) = error else {
                return XCTFail("StringCalculator does not thrown an exception with negative numbers")
            }

            XCTAssertEqual(values, [-1, -3])
            XCTAssertEqual(error.localizedDescription, "Negatives not allowed: -1,-3")
        }
    }
    
    func test_add_whenInputContainsNumbersGreaterThan1000_shouldIgnoreThem() {
        XCTAssertEqual(try! sut.add("1,1000,1001"), 1001)
    }
    
    func test_add_whenSingleDelimiterIsDefinedAtFirstLineStartingWithDoubleSlash_shouldBeUsedItToReturnSum() {
        XCTAssertEqual(try! sut.add("//#\n1#2"), 3)
    }
}
