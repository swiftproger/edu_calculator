//
//  String + Extension.swift
//  Calculator
//
//  Created by Александр Новиков on 07.09.2023.
//

import Foundation

extension String {
    var stringWithPoint: String {
        contains(".") ? replacingOccurrences(of: ".", with: ",") : self
    }

    var stringWithDot: String {
        contains(",") ? replacingOccurrences(of: ",", with: ".") : self
    }
}
