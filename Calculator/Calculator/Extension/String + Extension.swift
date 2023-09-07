//
//  String + Extension.swift
//  Calculator
//
//  Created by Александр Новиков on 07.09.2023.
//

import Foundation

extension String {
    var stringWithPoint: String {
        self.contains(".") ? self.replacingOccurrences(of: ".", with: ",") : self
    }
}
