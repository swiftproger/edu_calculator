//
//  UIStackView + Extension.swift
//  Calculator
//
//  Created by Александр Новиков on 04.09.2023.
//

import UIKit

extension UIStackView {
    convenience init(subviews: [UIView]) {
        self.init(arrangedSubviews: subviews)
        axis = .horizontal
        spacing = 1
        distribution = .fillEqually
    }
}
