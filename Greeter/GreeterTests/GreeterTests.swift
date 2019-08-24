//
//  GreeterTests.swift
//  GreeterTests
//
//  Created by Fabio Mignogna on 24/08/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import Foundation
import XCTest

class Greeter {
    func greet(_ name: String) -> String {
        return "Hello \(name.trimmingCharacters(in: .whitespaces).capitalizeFirstLetter())"
    }
}

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}

class GreeterTests: XCTestCase {

    let sut = Greeter()

    func test_greet_withNameAsInput_shouldReturnHelloName() {
        XCTAssertEqual(sut.greet("Fabio"), "Hello Fabio")
        XCTAssertEqual(sut.greet("Jenny"), "Hello Jenny")
    }

    func test_greet_withNameWithWhitespacesAsInput_shouldReturnHelloNameWithoutWhitespaces() {
        XCTAssertEqual(sut.greet("  Fabio  "), "Hello Fabio")
    }
    
    func test_great_withNameAsInput_shouldCapitalizeTheFirstLetterOfTheName() {
        XCTAssertEqual(sut.greet("fabio"), "Hello Fabio")
    }
}
