//
//  ViewController.swift
//  TestProject
//
//  Created by Vsevolod Lashin on 16.03.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var numberLabel: UILabel!
    
    private var currentNumber = ""
    private var resultOfCalculation = 0.0
    private var signOfOperation = ""
    private var isSignTapped = false
    private var isErrorAppear = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberLabel.text = "0"
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        guard !isErrorAppear else { return }
        guard currentNumber.count <= 8 else { return }
        guard let number = sender.currentTitle else { return }
        
        currentNumber += number
        
        numberLabel.text = currentNumber
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if isErrorAppear {
            numberLabel.text = "Ошибка"
        } else if currentNumber == "" {
            currentNumber += "0."
            numberLabel.text = currentNumber
        } else if !currentNumber.contains(".") && currentNumber.count <= 8 {
            currentNumber += "."
            numberLabel.text = currentNumber
        }
    }
    
    @IBAction func tapSignButton(_ sender: UIButton) {
        guard let operation = sender.currentTitle else { return }
        guard !isSignTapped else { return }
        
        signOfOperation = operation
        resultOfCalculation = Double(numberLabel.text ?? "") ?? 0.0
        currentNumber = ""
        isSignTapped = true
    }
    
    @IBAction func tapResultButton(_ sender: UIButton) {
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
        default:
            resultOfCalculation /= Double(numberLabel.text ?? "") ?? 0.0
        }
        
        getResultOfCalculation()
        
        currentNumber = ""
        isSignTapped = false
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        resultOfCalculation = 0
        numberLabel.text = "0"
        currentNumber = ""
        isSignTapped = false
        isErrorAppear = false
    }
    
    private func getResultOfCalculation() {
        if isErrorAppear {
            numberLabel.text = "Ошибка"
        } else if String(resultOfCalculation).count > 9 {
            numberLabel.text = "Большое число"
            isErrorAppear = true
        } else if resultOfCalculation.truncatingRemainder(dividingBy: 1) != 0 {
            resultOfCalculation = round(resultOfCalculation * 100000000) / 100000000
            numberLabel.text = String(resultOfCalculation)
        } else {
            let intResult = Int(resultOfCalculation)
            numberLabel.text = String(intResult)
        }
    }
}
