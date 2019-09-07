//
//  PrimeFactorsTests.swift
//  PrimeFactorsTests
//
//  Created by Fabio Mignogna on 07/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import XCTest

class PrimeFactors {
    func generate(_ n: inout Int) -> [Int] {
        var output = [Int]()
        if n > 1 {
            if n % 2 == 0 {
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
        assertThatPrimeFactorsOf(1, isEqualTo: [])
    }
    
    func test_generate_with2AsInput_shouldReturn_2() {
        assertThatPrimeFactorsOf(2, isEqualTo: [2])
    }
    
    func test_generate_with3AsInput_shouldReturn_3() {
        assertThatPrimeFactorsOf(3, isEqualTo: [3])
    }
    
    func test_generate_with4AsInput_shouldReturn_2_2() {
        assertThatPrimeFactorsOf(4, isEqualTo: [2,2])
    }
    
    func test_generate_with5AsInput_shouldReturn_5() {
        assertThatPrimeFactorsOf(5, isEqualTo: [5])
    }
    
    func test_generate_with6AsInput_shouldReturn_2_3() {
        assertThatPrimeFactorsOf(6, isEqualTo: [2,3])
    }
    
    // MARK: Helpers
    
    private func assertThatPrimeFactorsOf(_ input: Int, isEqualTo expected: [Int], file: StaticString = #file, line: UInt = #line) {
        var n = input
        XCTAssertEqual(sut.generate(&n), expected, file: file, line: line)
    }
}
