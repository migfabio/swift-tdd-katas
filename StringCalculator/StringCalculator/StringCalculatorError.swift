//
//  StringCalculatorError.swift
//  StringCalculator
//
//  Created by Fabio Mignogna on 01/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import Foundation

public enum StringCalculatorError: Error, LocalizedError {
    case nonNegativeNumber(numbers: [Int])
    case invalidInput
    
    public var errorDescription: String? {
        switch self {
        case .nonNegativeNumber(let numbers):
            return "Negatives not allowed: \(numbers.map { String($0) }.joined(separator: ","))"
        case .invalidInput:
            return "Invalid input"
        }
    }
}
