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
        return []
    }
}

class PrimeFactorsTests: XCTestCase {
    
    func test_generate_with1AsInput_shouldReturnAnEmptyArray() {
        let sut = PrimeFactors()
        XCTAssertEqual(sut.generate(1), [])
    }
}
