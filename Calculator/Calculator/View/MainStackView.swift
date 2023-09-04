//
//  MainStackView.swift
//  Calculator
//
//  Created by Александр Новиков on 04.09.2023.
//

import UIKit

class MainStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func createButton(title: String, tag: Int, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.tag = tag
        button.backgroundColor = color
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 22)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(keyboardButtonTapped), for: .touchUpInside)
        return button
    }
    
    @objc
    private func keyboardButtonTapped(sender: UIButton) {
        print(sender.tag)
    }
    
    private func setupMainStackView() {
        let button0 = createButton(title: "0", tag: 0, color: .gray)
        let buttonPoint = createButton(title: ",", tag: 10, color: .gray)
        let buttonEqual = createButton(title: "=", tag: 11, color: .orange)
    }
}
