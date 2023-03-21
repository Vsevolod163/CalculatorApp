//
//  ViewController.swift
//  TestProject
//
//  Created by Vsevolod Lashin on 16.03.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private var numberLabel: UILabel!
    
    private var currentNumber = ""
    private var resultOfCalculation = 0.0
    private var signOfOperation = ""
    private var isSignTapped = false
    private var isErrorAppear = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberLabel.text = "0"
    }
    
    @IBAction private func tapNumberButton(_ sender: UIButton) {
        guard !isErrorAppear else { return }
        guard currentNumber.count <= 8 else { return }
        guard let number = sender.currentTitle else { return }
        
        currentNumber += number
        
        numberLabel.text = currentNumber
    }
    
    @IBAction private func tapDotButton(_ sender: UIButton) {
        guard !isErrorAppear else { return }
        
        if currentNumber == "" {
            currentNumber += "0."
            numberLabel.text = currentNumber
        } else if !currentNumber.contains(".") && currentNumber.count <= 8 {
            currentNumber += "."
            numberLabel.text = currentNumber
        }
    }
    
    @IBAction private func tapSignButton(_ sender: UIButton) {
        guard let operation = sender.currentTitle else { return }
        guard !isSignTapped else { return }
        
        signOfOperation = operation
        resultOfCalculation = Double(numberLabel.text ?? "") ?? 0.0
        currentNumber = ""
        isSignTapped = true
    }
    
    @IBAction private func tapResultButton(_ sender: UIButton) {
        guard !isErrorAppear else { return }
        
        switch signOfOperation {
        case "+":
            resultOfCalculation += Double(numberLabel.text ?? "") ?? 0.0
        case "-":
            resultOfCalculation -= Double(numberLabel.text ?? "") ?? 0.0
        case "x":
            resultOfCalculation *= Double(numberLabel.text ?? "") ?? 0.0
        case "÷" where Double(numberLabel.text ?? "") ?? 0.0 == 0:
            isErrorAppear = true
        case "÷":
            resultOfCalculation /= Double(numberLabel.text ?? "") ?? 0.0
        default:
            break
        }
        
        if signOfOperation != "" {
            getResultOfCalculation()
        }
        
        signOfOperation = ""
        currentNumber = ""
        isSignTapped = false
    }
    
    @IBAction private func tapClearButton(_ sender: UIButton) {
        numberLabel.text = "0"
        currentNumber = ""
        signOfOperation = ""
        isSignTapped = false
        isErrorAppear = false
    }
    
    private func getResultOfCalculation() {
        if isErrorAppear {
            numberLabel.text = "Ошибка"
        } else if resultOfCalculation.truncatingRemainder(dividingBy: 1) != 0 {
            resultOfCalculation = round(resultOfCalculation * 100000000) / 100000000
            numberLabel.text = String(resultOfCalculation)
        } else if String(resultOfCalculation).count > 9 {
            numberLabel.text = "Большое число"
            isErrorAppear = true
        } else {
            let intResult = Int(resultOfCalculation)
            numberLabel.text = String(intResult)
        }
    }
}
