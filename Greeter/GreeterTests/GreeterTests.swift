//
//  GreeterTests.swift
//  GreeterTests
//
//  Created by Fabio Mignogna on 24/08/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import XCTest
import Greeter

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
    
    func test_greet_withNameAsInput_whenTimeIsBetween06amIncludedToNoonExcluded_shouldReturnGoodMorningName() {
        XCTAssertEqual(makeSUT(with: .sixAM).greet("Fabio"), "Good morning Fabio")
        XCTAssertEqual(makeSUT(with: .customHourAndMinute(hour: 11, minute: 59)).greet("Fabio"), "Good morning Fabio")
    }
    
    func test_greet_withNameAsInput_whenTimeIsBetween06pmIncludedTo10pmExcluded_shouldReturnGoodEveningName() {
        XCTAssertEqual(makeSUT(with: .sixPM).greet("Fabio"), "Good evening Fabio")
        XCTAssertEqual(makeSUT(with: .customHourAndMinute(hour: 21, minute: 59)).greet("Fabio"), "Good evening Fabio")
    }
    
    func test_greet_withNameAsInput_whenTimeIsBetween10pmIncludedTo06amExcluded_shouldReturnGoodNightName() {
        XCTAssertEqual(makeSUT(with: .tenPM).greet("Fabio"), "Good night Fabio")
        XCTAssertEqual(makeSUT(with: .customHourAndMinute(hour: 5, minute: 59, nextDay: true)).greet("Fabio"), "Good night Fabio")
    }
    
    func test_greet_withNameAsInput_whenTimeIsNoon_shouldReturnHelloName() {
        XCTAssertEqual(makeSUT(with: .noon).greet("Fabio"), "Hello Fabio")
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
        case customHourAndMinute(hour: Int, minute: Int, nextDay: Bool = false)
        
        private var today: Date {
            let calendar = Calendar(identifier: .gregorian)
            return calendar.startOfDay(for: Date())
        }
        
        var date: Date {
            let calendar = Calendar(identifier: .gregorian)
            switch self {
            case .sixAM:
                return calendar.date(bySetting: .hour, value: 06, of: today)!
            case .noon:
                return calendar.date(bySetting: .hour, value: 12, of: today)!
            case .sixPM:
                return calendar.date(bySetting: .hour, value: 18, of: today)!
            case .tenPM:
                return calendar.date(bySetting: .hour, value: 22, of: today)!
            case .customHourAndMinute(let hour, let minute, let nextDay):
                let customDate = calendar.date(bySettingHour: hour, minute: minute, second: 0, of: today)!
                return nextDay ? calendar.date(byAdding: .day, value: 1, to: customDate)! : customDate
            }
        }
    }
}
