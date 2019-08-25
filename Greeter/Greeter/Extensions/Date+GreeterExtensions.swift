//
//  Date+GreeterExtensions.swift
//  Greeter
//
//  Created by Fabio Mignogna on 25/08/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import Foundation

extension Date {
    static var today: Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.startOfDay(for: Date())
    }
    
    static var todaySixAM: Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(bySetting: .hour, value: 06, of: today)!
    }
    
    static var todayNoon: Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(bySetting: .hour, value: 12, of: today)!
    }
    
    static var todaySixPM: Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(bySetting: .hour, value: 18, of: today)!
    }
    
    static var todayTenPM: Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(bySetting: .hour, value: 22, of: today)!
    }
    
    static var tomorrowSixAM: Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(byAdding: .day, value: 1, to: todaySixAM)!
    }
}
