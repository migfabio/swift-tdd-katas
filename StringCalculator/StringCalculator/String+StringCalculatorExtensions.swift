//
//  String+StringCalculatorExtensions.swift
//  StringCalculator
//
//  Created by Fabio Mignogna on 01/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

extension String {
    func components(separatedBy separators: [String]) -> [String] {
        return separators.reduce([self]) { result, separator in
            return result.flatMap { $0.components(separatedBy: separator) }
        }
    }
}
