//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Fabio Mignogna on 01/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

public class StringCalculator {
    
    public init() {}
    
    public func add(_ input: String) throws -> Int {
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
