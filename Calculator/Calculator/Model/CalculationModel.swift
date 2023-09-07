//
//  CalculationModel.swift
//  Calculator
//
//  Created by Александр Новиков on 04.09.2023.
//

import Foundation

class CalculationModel {
    
    private var firstNumber: Double = 0.0
    private var secondNumber: Double = 0.0
    private var currentNumber: String = ""
    private var historyNumber: String = ""
    private var currentOperation: OperationModel  = .noAction
    
    public func getHistory(tag: Int) -> String {
        switch tag {
        case 0...9:
            historyNumber += "\(tag)"
        case 12...15:
            historyNumber += currentOperation.rawValue
        default:
            print("error history tag")
        }
        return historyNumber
    }
    
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
        currentNumber.stringWithPoint
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
        
        return firstNumber.stringWithoutZeroFraction
    }
    
    public func getResult() -> String {
        // TODO: Исправить, при вводе значении с точкой и нажатии =, значение пропадает.
        guard let number = Double(currentNumber) else { return "" }
        secondNumber = number
        
        var result = 0.0
        
        switch currentOperation {
        case .noAction:
            result = number
        case .addition:
            result = firstNumber + secondNumber
        case .subtraction:
            result = firstNumber - secondNumber
        case .multiplication:
            result = firstNumber * secondNumber
        case .division:
            guard secondNumber != 0 else { return "Не определено" }
            result = firstNumber / secondNumber
        }
        return result.stringWithoutZeroFraction.stringWithPoint
    }
    
    public func resetValue() {
        firstNumber = 0
        secondNumber = 0
        currentNumber = ""
        historyNumber = ""
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
        guard !currentNumber.contains(",") else { return }
        currentNumber += currentNumber != "" ? "," : "0,"
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
