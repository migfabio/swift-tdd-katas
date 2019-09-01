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
        let intValues = try getIntValuesOrThrow(from: stringValues)
        let validIntValues = filterOutGreaterThan1000(intValues)
        try assertNoNegativesOrThrow(from: validIntValues)
        return validIntValues.reduce(0, +)
    }
    
    private func getDelimiters(for string: String) -> [String] {
        if let range = range(for: string) {
            let delimiterString = string[range]
            let startIndex = delimiterString.index(delimiterString.startIndex, offsetBy: 2)
            let endIndex = delimiterString.index(delimiterString.endIndex, offsetBy: -1)
            return [String(string[startIndex..<endIndex])]
        }
        return [",", "\n"]
    }
    
    private func getStringToSplit(from string: String) -> String {
        if let range = range(for: string) {
            return String(string[range.upperBound...])
        }
        return string
    }
    
    private func range(for string: String) -> Range<String.Index>? {
        return string.range(of: "//.*\n", options: [.regularExpression, .anchored])
    }
    
    private func getIntValuesOrThrow(from strings: [String]) throws -> [Int] {
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
    func components(separatedBy separators: [String]) -> [String] {
        return separators.reduce([self]) { result, separator in
            return result.flatMap { $0.components(separatedBy: separator) }
        }
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
    
    func test_add_whenMultipleCharDelimiterIsDefinedAtFirstLineStartingWithDoubleSlash_shouldBeUsedItToReturnSum() {
        XCTAssertEqual(try! sut.add("//###\n1###2"), 3)
    }
}
