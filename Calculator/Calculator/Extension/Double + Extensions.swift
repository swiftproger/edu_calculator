//
//  Double + Extensions.swift
//  Calculator
//
//  Created by Александр Новиков on 07.09.2023.
//

import Foundation

extension Double {
    
    var stringWithoutZeroFraction: String {
        truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
