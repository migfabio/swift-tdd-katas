//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Fabio Mignogna on 31/08/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import XCTest

enum StringCalculatorError: Error, LocalizedError {
    case nonNegativeNumber(numbers: [Int])
    case invalidInput
    
    var errorDescription: String? {
        switch self {
        case .nonNegativeNumber(let numbers):
            return "Negatives not allowed: \(numbers.map { String($0) }.joined(separator: ","))"
        case .invalidInput:
            return "Invalid input"
        }
    }
}

class StringCalculator {
    
    func add(_ input: String) throws -> Int {
        guard !input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return 0
        }
        let delimiters = getDelimiters(for: input)
        let stringToSplit = getStringToSplit(from: input)
        let stringValues = stringToSplit.components(separatedBy: delimiters)
        let intValuesOrThrow = try intValues(from: stringValues)
        let validIntValues = filterOutGreaterThan1000(intValuesOrThrow)
        try assertNoNegativesOrThrow(from: validIntValues)
        return validIntValues.reduce(0, +)
    }
    
    private func getDelimiters(for string: String) -> CharacterSet {
        if string.hasPrefix("//") {
            return CharacterSet(charactersIn: String(string[2]))
        }
        return [",", "\n"]
    }
    
    private func getStringToSplit(from string: String) -> String {
        return String(string[range(for: string)])
    }
    
    private func range(for string: String) -> PartialRangeFrom<String.Index> {
        if let range = string.range(of: "//.\n", options: [.regularExpression, .anchored]) {
            return range.upperBound...
        }
        return string.startIndex...
    }
    
    private func intValues(from strings: [String]) throws -> [Int] {
        return try strings.map {
            let string = $0.trimmingCharacters(in: .whitespaces)
            guard let value = Int(string) else {
                throw StringCalculatorError.invalidInput
            }
            return value
        }
    }
    
    private func filterOutGreaterThan1000(_ values: [Int]) -> [Int] {
        return values.filter { $0 <= 1000 }
    }
    
    private func assertNoNegativesOrThrow(from values: [Int]) throws {
        let negatives = values.filter({ $0 < 0 })
        if !negatives.isEmpty {
            throw StringCalculatorError.nonNegativeNumber(numbers: negatives)
        }
    }
}

extension String {
    subscript(offset: Int) -> Character {
        return self[index(startIndex, offsetBy: offset)]
    }
}

class StringCalculatorTests: XCTestCase {
    
    private let sut = StringCalculator()
    
    func test_add_whenInputIsEmptyString_shouldReturnZero() {
        XCTAssertEqual(try! sut.add(""), 0)
        XCTAssertEqual(try! sut.add("  "), 0)
    }
    
    func test_add_whenInputIsSingleNumber_shouldReturnValue() {
        XCTAssertEqual(try! sut.add("1"), 1)
        XCTAssertEqual(try! sut.add("2"), 2)
        XCTAssertEqual(try! sut.add("3   "), 3)
    }
    
    func test_add_whenInputIsTwoNumberCommaDelimited_shouldReturnSum() {
        XCTAssertEqual(try! sut.add("1,2"), 3)
        XCTAssertEqual(try! sut.add("2  ,  3"), 5)
    }
    
    func test_add_whenInputIsTwoNumberNewLineDelimited_shouldReturnSum() {
        XCTAssertEqual(try! sut.add("1\n2"), 3)
        XCTAssertEqual(try! sut.add("1  \n  2"), 3)
    }
    
    func test_add_whenInputIsThreeNumberDelimitedEitherWay_shouldReturnSum() {
        XCTAssertEqual(try! sut.add("1\n2,3\n4"), 10)
        XCTAssertEqual(try! sut.add(" 1 \n 2 , 3 \n 4 "), 10)
    }
        
    func test_add_whenInputAreNegativeNumbers_shouldThrowNonNegativeNumberError() {
        XCTAssertThrowsError(try sut.add("-1,2,-3")) { (error) in
            guard case StringCalculatorError.nonNegativeNumber(let values) = error else {
                return XCTFail("StringCalculator does not throw an error for negative numbers")
            }

            XCTAssertEqual(values, [-1, -3])
            XCTAssertEqual(error.localizedDescription, "Negatives not allowed: -1,-3")
        }
    }
    
    func test_add_whenInputContainsNumbersGreaterThan1000_shouldIgnoreThem() {
        XCTAssertEqual(try! sut.add("1,1000,1001"), 1001)
    }
    
    func test_add_whenSingleCharDelimiterIsDefinedAtFirstLineStartingWithDoubleSlash_shouldBeUsedItToReturnSum() {
        XCTAssertEqual(try! sut.add("//#\n1#2"), 3)
    }
    
    func test_add_whenInvalidInput_shouldThrowInvalidInputError() {
        XCTAssertThrowsError(try sut.add("1,\n")) { (error) in
            guard case StringCalculatorError.invalidInput = error else {
                return XCTFail("StringCalculator does not throw an error for invalid input")
            }

            XCTAssertEqual(error.localizedDescription, "Invalid input")
        }
    }
}
