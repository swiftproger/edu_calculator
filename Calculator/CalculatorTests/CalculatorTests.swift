//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Александр Новиков on 08.09.2023.
//

@testable import Calculator
import XCTest

final class CalculatorTests: XCTestCase {
    var sut: CalculationModel!

    override func setUp() {
        super.setUp()
        sut = CalculationModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSetNumber() {
        sut.setNumber(number: 1)

        var value = sut.currentNumber

        XCTAssert(value == "1", "Значение не равно заданному")

        sut.setNumber(number: 1)

        value = sut.currentNumber

        XCTAssert(value == "11", "Значение не равно заданному 2")
    }
}
