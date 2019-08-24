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
        return "Hello \(name.trimmingCharacters(in: .whitespaces))"
    }
}

class GreeterTests: XCTestCase {

    func test_greet_withNameAsInput_shoulReturnHelloName() {
        let sut = Greeter()
        XCTAssertEqual(sut.greet("Fabio"), "Hello Fabio")
        XCTAssertEqual(sut.greet("Jenny"), "Hello Jenny")
    }

    func test_greet_withNameWithWhitespaces_shouldReturnHelloNameWithoutWhitespaces() {
        let sut = Greeter()
        XCTAssertEqual(sut.greet("  Fabio  "), "Hello Fabio")
    }
}
