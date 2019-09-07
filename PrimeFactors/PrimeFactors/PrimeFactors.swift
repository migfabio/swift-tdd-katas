//
//  PrimeFactors.swift
//  PrimeFactors
//
//  Created by Fabio Mignogna on 07/09/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

public class PrimeFactors {
    
    public init() {}
    
    public func generate(_ n: inout Int) -> [Int] {
        var factors = [Int]()
        var divisor = 2
        while n > 1 {
            while n % divisor == 0 {
                factors.append(divisor)
                n /= divisor
            }
            divisor += 1
        }
        return factors
    }
}
