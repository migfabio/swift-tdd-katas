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
    private let date: Date?
    
    init(date: Date? = nil) {
        self.date = date
    }
    
    func greet(_ name: String) -> String {
        var greetingMessage = "Hello"
        if let date = date {
            let calendar = Calendar(identifier: .gregorian)
            let hour = calendar.component(.hour, from: date)
            if hour >= 6 && hour <= 12 {
                greetingMessage = "Good morning"
            }
        }
        
        return "\(greetingMessage) \(name.trimmingCharacters(in: .whitespaces).capitalizeFirstLetter())"
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
    
    func test_greet_withNameAsInput_shouldCapitalizeTheFirstLetterOfTheName() {
        XCTAssertEqual(sut.greet("fabio"), "Hello Fabio")
    }
    
    func test_greet_withNameAsInput_whenTimeIsBetween06amTo12pm_shouldReturnGoodMorningName() {
        let calendar = Calendar(identifier: .gregorian)
        let sixAm = calendar.date(bySetting: .hour, value: 06, of: Date())
        var sut = Greeter(date: sixAm)
        
        XCTAssertEqual(sut.greet("Fabio"), "Good morning Fabio")
        
        let twelvePm = calendar.date(bySetting: .hour, value: 12, of: Date())
        sut = Greeter(date: twelvePm)
        
        XCTAssertEqual(sut.greet("Fabio"), "Good morning Fabio")
    }
}
