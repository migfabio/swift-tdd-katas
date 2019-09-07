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
        var n = input
        var output = [Int]()
        if input > 1 {
            if input % 2 == 0 {
                output.append(2)
                n /= 2
            }
            if n > 1 {
                output.append(n)
            }
        }
        return output
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
    
    func test_generate_with3AsInput_shouldReturn_3() {
        XCTAssertEqual(sut.generate(3), [3])
    }
    
    func test_generate_with4AsInput_shouldReturn_2_2() {
        XCTAssertEqual(sut.generate(4), [2,2])
    }
}
