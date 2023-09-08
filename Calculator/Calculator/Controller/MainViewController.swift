//
//  ViewController.swift
//  Calculator
//
//  Created by Александр Новиков on 31.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 60)
        label.textColor = .white
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let historyLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .gray
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainStackView = MainStackView()
    
    private let calculationModel = CalculationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        view.addSubview(resultLabel)
        view.addSubview(mainStackView)
        view.addSubview(historyLabel)
        mainStackView.delegate = self
    }
}

extension MainViewController: MainStackViewProtocol {
    func tapNumberButton(tag: Int) {
        calculationModel.setNumber(number: tag)
        resultLabel.text = calculationModel.getCurrentNumber()
        historyLabel.text = calculationModel.getHistory(tag: tag)
    }
    
    func tapActionButton(tag: Int) {
        switch tag {
        case 10: // .
            historyLabel.text = calculationModel.getHistory(tag: tag)
            calculationModel.addPoint()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 11: // =
            resultLabel.text = calculationModel.getResult()
        case 12: // +
            resultLabel.text = calculationModel.setOperation(operation: .addition)
            historyLabel.text = calculationModel.getHistory(tag: tag)
        case 13: // -
            resultLabel.text = calculationModel.setOperation(operation: .subtraction)
            historyLabel.text = calculationModel.getHistory(tag: tag)
        case 14: // *
            resultLabel.text = calculationModel.setOperation(operation: .multiplication)
            historyLabel.text = calculationModel.getHistory(tag: tag)
        case 15: // /
            resultLabel.text = calculationModel.setOperation(operation: .division)
            historyLabel.text = calculationModel.getHistory(tag: tag)
        case 16: // %
            historyLabel.text = calculationModel.getHistory(tag: tag)
            calculationModel.setPercentNumber()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 17: // +/-
            historyLabel.text = calculationModel.getHistory(tag: tag)
            calculationModel.invertValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 18: // AC
            calculationModel.resetValue()
            resultLabel.text = "0"
            historyLabel.text = "0"
        default: return
        }
    }
}

extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainStackView.heightAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 1),
            
            historyLabel.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -10),
            historyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            historyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            resultLabel.bottomAnchor.constraint(equalTo: historyLabel.topAnchor, constant: -10),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
