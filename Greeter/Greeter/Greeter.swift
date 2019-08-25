//
//  Greeter.swift
//  Greeter
//
//  Created by Fabio Mignogna on 25/08/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

import Foundation

public class Greeter {
    private let date: Date?
    
    public init(date: Date? = nil) {
        self.date = date
    }
    
    public func greet(_ name: String) -> String {
        var greetingMessage = "Hello"
        if let date = date {
            if date >= Date.todaySixAM && date < Date.todayNoon {
                greetingMessage = "Good morning"
            } else if date >= Date.todaySixPM && date < Date.todayTenPM {
                greetingMessage = "Good evening"
            } else if date >= Date.todayTenPM && date < Date.tomorrowSixAM {
                greetingMessage = "Good night"
            }
        }
        
        return "\(greetingMessage) \(name.trimmingCharacters(in: .whitespaces).capitalizeFirstLetter())"
    }
}
