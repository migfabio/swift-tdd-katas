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
        let intValues = input.split { $0 == "," || $0 == "\n" }
            .map { Int($0.trimmingCharacters(in: .whitespaces)) ?? 0 }
        return intValues.reduce(0, +)
    }
}

class StringCalculatorTests: XCTestCase {
    
    private let sut = StringCalculator()
    
    func test_add_whenInputIsEmptyString_shouldReturnZero() {
        XCTAssertEqual(sut.add(""), 0)
        XCTAssertEqual(sut.add("  "), 0)
    }
    
    func test_add_whenInputIsSingleNumber_shouldReturnValue() {
        XCTAssertEqual(sut.add("1"), 1)
        XCTAssertEqual(sut.add("2"), 2)
        XCTAssertEqual(sut.add("3   "), 3)
    }
    
    func test_add_whenInputIsTwoNumberCommaDelimited_shouldReturnSum() {
        XCTAssertEqual(sut.add("1,2"), 3)
        XCTAssertEqual(sut.add("2  ,  3"), 5)
    }
    
    func test_add_whenInputIsTwoNumberNewLineDelimited_shouldReturnSum() {
        XCTAssertEqual(sut.add("1\n2"), 3)
        XCTAssertEqual(sut.add("1  \n  2"), 3)
    }
    
    func test_add_whenInputIsThreeNumberDelimitedEitherWay_shouldReturnSum() {
        XCTAssertEqual(sut.add("1\n2,3\n4"), 10)
        XCTAssertEqual(sut.add(" 1 \n 2 , 3 \n 4 "), 10)
    }
}
