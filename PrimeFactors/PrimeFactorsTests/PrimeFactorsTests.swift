//
//  PrimeFactorsTests.swift
//  PrimeFactorsTests
//
//  Created by Fabio Mignogna on 07/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import XCTest

class PrimeFactors {
    func generate(_ input: Int) -> [Int] {
        if input > 1 {
            return [2]
        }
        return []
    }
}

class PrimeFactorsTests: XCTestCase {
    
    private let sut = PrimeFactors()
    
    func test_generate_with1AsInput_shouldReturnAnEmptyArray() {
        XCTAssertEqual(sut.generate(1), [])
    }
    
    func test_generate_with2AsInput_shouldReturn_2() {
        XCTAssertEqual(sut.generate(2), [2])
    }
}
