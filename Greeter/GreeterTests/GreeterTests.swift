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
            } else if hour >= 18 && hour <= 22 {
                greetingMessage = "Good evening"
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

    func test_greet_withNameAsInput_shouldReturnHelloName() {
        XCTAssertEqual(makeSUT().greet("Fabio"), "Hello Fabio")
        XCTAssertEqual(makeSUT().greet("Jenny"), "Hello Jenny")
    }

    func test_greet_withNameWithWhitespacesAsInput_shouldReturnHelloNameWithoutWhitespaces() {
        XCTAssertEqual(makeSUT().greet("  Fabio  "), "Hello Fabio")
    }
    
    func test_greet_withNameAsInput_shouldCapitalizeTheFirstLetterOfTheName() {
        XCTAssertEqual(makeSUT().greet("fabio"), "Hello Fabio")
    }
    
    func test_greet_withNameAsInput_whenTimeIsBetween06amToNoon_shouldReturnGoodMorningName() {
        XCTAssertEqual(makeSUT(with: .sixAM).greet("Fabio"), "Good morning Fabio")
        XCTAssertEqual(makeSUT(with: .noon).greet("Fabio"), "Good morning Fabio")
    }
    
    func test_greet_withNameAsInput_whenTimeIsBetween06pmTo10pm_shouldReturnGoodEveningName() {
        XCTAssertEqual(makeSUT(with: .sixPM).greet("Fabio"), "Good evening Fabio")
        XCTAssertEqual(makeSUT(with: .tenPM).greet("Fabio"), "Good evening Fabio")
    }
    
    // MARK: - Helper
    
    private func makeSUT(with dateTime: DateTime? = nil) -> Greeter {
        return Greeter(date: dateTime?.date)
    }
    
    private enum DateTime {
        case sixAM
        case noon
        case sixPM
        case tenPM
        
        var date: Date? {
            let calendar = Calendar(identifier: .gregorian)
            switch self {
            case .sixAM:
                return calendar.date(bySetting: .hour, value: 06, of: Date())
            case .noon:
                return calendar.date(bySetting: .hour, value: 12, of: Date())
            case .sixPM:
                return calendar.date(bySetting: .hour, value: 18, of: Date())
            case .tenPM:
                return calendar.date(bySetting: .hour, value: 22, of: Date())
            }
        }
    }
}
