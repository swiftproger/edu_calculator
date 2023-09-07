//
//  CalculationModel.swift
//  Calculator
//
//  Created by Александр Новиков on 04.09.2023.
//

import Foundation

class CalculationModel {
    
    private var firstNumber = 0.0
    private var secondNumber = 0.0
    private var currentNumber = ""
    private var currentOperation = OperationModel.noAction
    
    public func setNumber(number: Int) {
        
        if number != 0 && currentNumber == "0" {
            currentNumber.removeFirst()
        }
        
        if number == 0 && currentNumber == "0" {
            currentNumber.removeLast()
        }
        
        currentNumber.append(String(number))
    }
    
    public func getCurrentNumber() -> String {
        currentNumber
    }
    
    public func setOperation(operation: OperationModel) -> String {
        
        if currentOperation == .noAction {
            guard let number = Double(currentNumber) else { return "" }
            firstNumber = number
        } else {
            guard let result = Double(getResult()) else { return "" }
            firstNumber = result
        }
        
        currentNumber = ""
        currentOperation = operation
        
        return String(firstNumber)
    }
    
    public func getResult() -> String {
        guard let number = Double(currentNumber) else { return "" }
        secondNumber = number
        
        switch currentOperation {
        case .noAction:
            print("noAction")
            return "0"
        case .addition:
            return String(firstNumber + secondNumber)
        case .subtraction:
            return String(firstNumber - secondNumber)
        case .multiplication:
            return String(firstNumber * secondNumber)
        case .division:
            guard secondNumber != 0 else { return "Не определено" }
            return String(firstNumber / secondNumber)
        }
    }
    
    public func resetValue() {
        firstNumber = 0
        secondNumber = 0
        currentNumber = ""
        currentOperation = .noAction
    }
    
    public func invertValue() {
        guard let number = Double(currentNumber) else { return }
        
        if number > 0 {
            currentNumber.insert("-", at: currentNumber.startIndex)
        } else if number < 0 {
            currentNumber.remove(at: currentNumber.startIndex)
        } else {
            return
        }
    }
    
    public func addPoint() {
        currentNumber += currentNumber != "" ? "." : "0."
    }
    
    public func setPercentNumber() {
        guard let number = Double(currentNumber) else { return }
        
        if firstNumber == 0 {
            currentNumber = "\(number / 100)"
        } else {
            currentNumber = "\(firstNumber * number / 100)"
        }
    }
}
