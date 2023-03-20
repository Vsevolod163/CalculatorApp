//
//  ViewController.swift
//  TestProject
//
//  Created by Vsevolod Lashin on 16.03.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var numberLabel: UILabel!
    
    private var stringOfNumbers = ""
    private var resultOfCalculate = 0.0
    private var sign = ""
    private var isSignTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        let numberOnButton = sender.titleLabel?.text
        
        if stringOfNumbers.count <= 8 {
            switch numberOnButton {
            case "0":
                stringOfNumbers += "0"
            case "1":
                stringOfNumbers += "1"
            case "2":
                stringOfNumbers += "2"
            case "3":
                stringOfNumbers += "3"
            case "4":
                stringOfNumbers += "4"
            case "5":
                stringOfNumbers += "5"
            case "6":
                stringOfNumbers += "6"
            case "7":
                stringOfNumbers += "7"
            case "8":
                stringOfNumbers += "8"
            default:
                stringOfNumbers += "9"
            }
            
            numberLabel.text = stringOfNumbers
        }
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if stringOfNumbers == "" {
            stringOfNumbers += "0."
            numberLabel.text = stringOfNumbers
        } else if !stringOfNumbers.contains(".") && stringOfNumbers.count <= 8 {
            stringOfNumbers += "."
            numberLabel.text = stringOfNumbers
        }
    }
    
    @IBAction func tapSignButton(_ sender: UIButton) {
        if !isSignTapped {
            let signOnButton = sender.titleLabel?.text
            
            switch signOnButton {
            case "+":
                sign = "+"
            case "-":
                sign = "-"
            case "x":
                sign = "x"
            default:
                sign = "÷"
            }
            
            resultOfCalculate = Double(numberLabel.text ?? "") ?? 0.0
            stringOfNumbers = ""
        }
        isSignTapped = true
    }
    
    @IBAction func tapResultButton(_ sender: UIButton) {
        switch sign {
        case "+":
            resultOfCalculate += Double(numberLabel.text ?? "") ?? 0.0
        case "-":
            resultOfCalculate -= Double(numberLabel.text ?? "") ?? 0.0
        case "x":
            resultOfCalculate *= Double(numberLabel.text ?? "") ?? 0.0
        case "÷" where Double(numberLabel.text ?? "") ?? 0.0 == 0:
            resultOfCalculate = 0
            numberLabel.text = "Ошибка"
        case "÷":
            resultOfCalculate /= Double(numberLabel.text ?? "") ?? 0.0
        default:
            resultOfCalculate += 0
        }
        
        if numberLabel.text == "Ошибка" {
            resultOfCalculate = 0
        } else if resultOfCalculate.truncatingRemainder(dividingBy: 1) != 0 {
            resultOfCalculate = round(resultOfCalculate * 100000000) / 100000000
            numberLabel.text = String(resultOfCalculate)
        } else if String(resultOfCalculate).count > 9 {
            numberLabel.text = "Большое число"
        } else {
            let intResult = Int(resultOfCalculate)
            numberLabel.text = String(intResult)
        }
        
        stringOfNumbers = ""
        isSignTapped = false
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        resultOfCalculate = 0
        numberLabel.text = "0"
        stringOfNumbers = ""
        isSignTapped = false
    }
}
