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
        currentNumber.append(String(number))
    }
    
    public func getCurrentNumber() -> String {
        currentNumber
    }
    
    public func setOperation(operation: OperationModel) {
        guard let number = Double(currentNumber) else { return }
        firstNumber = number
        currentNumber = ""
        currentOperation = operation
    }
    
    public func getResult() -> String {
        guard let number = Double(currentNumber) else { return "" }
        secondNumber = number
        
        switch currentOperation {
            
        case .noAction:
            print("noAction")
        case .addition:
            return String(firstNumber + secondNumber)
        case .subtraction:
            return String(firstNumber - secondNumber)
        case .multiplication:
            return String(firstNumber * secondNumber)
        case .division:
            return String(firstNumber / secondNumber)
        }
        return "0"
    }
    
}
