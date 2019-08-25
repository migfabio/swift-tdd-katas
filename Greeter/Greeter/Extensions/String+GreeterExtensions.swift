//
//  String+GreeterExtensions.swift
//  Greeter
//
//  Created by Fabio Mignogna on 25/08/2019.
//  Copyright © 2019 Fabio Mignogna. All rights reserved.
//

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
