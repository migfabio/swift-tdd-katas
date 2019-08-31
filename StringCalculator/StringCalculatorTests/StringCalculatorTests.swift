//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Fabio Mignogna on 31/08/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import XCTest

class StringCalculator {
    func add(_ input: String) -> Int {
        let values = input.split(separator: ",")
        let sum = values.reduce(0) { (acc, value) -> Int in
            return acc + (Int(value) ?? 0)
        }
        return sum
    }
}

class StringCalculatorTests: XCTestCase {
    
    private let sut = StringCalculator()
    
    func test_add_whenInputIsEmptyString_shouldReturnZero() {
        XCTAssertEqual(sut.add(""), 0)
    }
    
    func test_add_whenInputIsSingleNumber_shouldReturnValue() {
        XCTAssertEqual(sut.add("1"), 1)
        XCTAssertEqual(sut.add("2"), 2)
    }
    
    func test_add_whenInputIsTwoNumberCommaDelimited_shouldReturnSum() {
        XCTAssertEqual(sut.add("1,2"), 3)
    }
}
