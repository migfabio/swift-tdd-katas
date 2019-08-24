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
        let allCharactersExcludingFirstRange = name.index(name.startIndex, offsetBy: 1)..<name.endIndex
        let outputName = String(name[name.startIndex]).capitalized + String(name[allCharactersExcludingFirstRange])
        return "Hello \(outputName.trimmingCharacters(in: .whitespaces))"
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
