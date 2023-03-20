//
//  ViewController.swift
//  TestProject
//
//  Created by Vsevolod Lashin on 16.03.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var numberLabel: UILabel!
    

    @IBOutlet var clearButton: UIButton!
    
    private var stringOfNumbers = ""
    private var result = 0.0
    private var sign = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
    }

    @IBAction func tapZeroButton(_ sender: UIButton) {
        if stringOfNumbers.count <= 8 {
            stringOfNumbers += "0"
            numberLabel.text = stringOfNumbers
        }
    }
    
    @IBAction func tapOneButton(_ sender: UIButton) {
        if stringOfNumbers.count <= 8 {
            stringOfNumbers += "1"
            numberLabel.text = stringOfNumbers
        }
    }
    
    @IBAction func tapTwoButton(_ sender: UIButton) {
        if stringOfNumbers.count <= 8 {
            stringOfNumbers += "2"
            numberLabel.text = stringOfNumbers
        }
    }
    @IBAction func tapThreeButton(_ sender: UIButton) {
        if stringOfNumbers.count <= 8 {
            stringOfNumbers += "3"
            numberLabel.text = stringOfNumbers
        }
    }
    
    @IBAction func tapFourButton(_ sender: UIButton) {
        if stringOfNumbers.count <= 8 {
            stringOfNumbers += "4"
            numberLabel.text = stringOfNumbers
        }
    }
    
    @IBAction func tapFiveButton(_ sender: UIButton) {
        if stringOfNumbers.count <= 8 {
            stringOfNumbers += "5"
            numberLabel.text = stringOfNumbers
        }
    }
    
    @IBAction func tapSixButton(_ sender: UIButton) {
        if stringOfNumbers.count <= 8 {
            stringOfNumbers += "6"
            numberLabel.text = stringOfNumbers
        }
    }
    
    @IBAction func tapSevenButton(_ sender: UIButton) {
        if stringOfNumbers.count <= 8 {
            stringOfNumbers += "7"
            numberLabel.text = stringOfNumbers
        }
    }
    
    @IBAction func tapEightButton(_ sender: UIButton) {
        if stringOfNumbers.count <= 8 {
            stringOfNumbers += "8"
            numberLabel.text = stringOfNumbers
        }
    }
    
    @IBAction func tapNineButton(_ sender: UIButton) {
        if stringOfNumbers.count <= 8 {
            stringOfNumbers += "9"
            numberLabel.text = stringOfNumbers
        }
    }
    
    @IBAction func getPlusButton(_ sender: UIButton) {
        result = Double(numberLabel.text ?? "") ?? 0.0
        sign = "+"
        stringOfNumbers = ""
    }
    
    @IBAction func getMinusButton(_ sender: UIButton) {
        result = Double(numberLabel.text ?? "") ?? 0.0
        sign = "-"
        stringOfNumbers = ""
    }
    
    @IBAction func getMultiplyButton(_ sender: UIButton) {
        result = Double(numberLabel.text ?? "") ?? 0.0
        sign = "x"
        stringOfNumbers = ""
    }
    
    @IBAction func getDivisionButton(_ sender: UIButton) {
        result = Double(numberLabel.text ?? "") ?? 0.0
        sign = "÷"
        stringOfNumbers = ""
    }
    
    @IBAction func getResultButton(_ sender: UIButton) {
        switch sign {
        case "+":
            result += Double(numberLabel.text ?? "") ?? 0.0
        case "-":
            result -= Double(numberLabel.text ?? "") ?? 0.0
        case "x":
            result *= Double(numberLabel.text ?? "") ?? 0.0
        case "÷" where Double(numberLabel.text ?? "") ?? 0.0 == 0:
            result = 0
            numberLabel.text = "Ошибка"
        case "÷":
            result /= Double(numberLabel.text ?? "") ?? 0.0
        default:
            result += 0
        }
        
        if numberLabel.text == "Ошибка" {
            result = 0
        } else if result.truncatingRemainder(dividingBy: 1) != 0 {
            result = round(result * 100000000) / 100000000
            numberLabel.text = String(result)
        } else if String(result).count > 9 {
            numberLabel.text = "Большое число"
        } else {
            let intResult = Int(result)
            numberLabel.text = String(intResult)
        }
        
        stringOfNumbers = ""
    }
    
    @IBAction func getClearResultButton(_ sender: UIButton) {
        result = 0
        numberLabel.text = "0"
        stringOfNumbers = ""
    }
}

