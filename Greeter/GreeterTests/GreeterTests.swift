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
        return "Hello \(name)"
    }
}

class GreeterTests: XCTestCase {

    func test_greet_withNameAsInput_ShoulReturnHelloName() {
        let sut = Greeter()
        XCTAssertEqual(sut.greet("Fabio"), "Hello Fabio")
        XCTAssertEqual(sut.greet("Jenny"), "Hello Jenny")
    }
}
