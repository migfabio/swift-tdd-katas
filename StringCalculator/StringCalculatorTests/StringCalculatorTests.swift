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
        return 0
    }
}

class StringCalculatorTests: XCTestCase {
    
    func test_add_whenInputIsEmptyString_shouldReturnZero() {
        let sut = StringCalculator()
        
        XCTAssertEqual(sut.add(""), 0)
    }
}
