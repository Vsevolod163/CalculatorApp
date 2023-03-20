//
//  ViewController.swift
//  TestProject
//
//  Created by Vsevolod Lashin on 16.03.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var numberLabel: UILabel!
    
    @IBOutlet var zeroNumberButton: UIButton!
    @IBOutlet var numberNineButton: UIButton!
    @IBOutlet var numberEightButton: UIButton!
    @IBOutlet var numberSevenButton: UIButton!
    @IBOutlet var numberSixButton: UIButton!
    @IBOutlet var numberFiveButton: UIButton!
    @IBOutlet var numberFourButton: UIButton!
    @IBOutlet var numberThreeButton: UIButton!
    @IBOutlet var numberTwoButton: UIButton!
    @IBOutlet var numberOneButton: UIButton!
    @IBOutlet var clearButton: UIButton!
    
    private var result = 0
    private var sign = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
    }
    

    @IBAction func getPlusButton(_ sender: UIButton) {
        result = Int(numberLabel.text ?? "") ?? 0
        sign = "+"
    }
    
    @IBAction func getMinusButton(_ sender: UIButton) {
        result = Int(numberLabel.text ?? "") ?? 0
        sign = "-"
    }
    
    @IBAction func getMultiplyButton(_ sender: UIButton) {
        result = Int(numberLabel.text ?? "") ?? 0
        sign = "x"
    }
    
    @IBAction func getDivisionButton(_ sender: UIButton) {
        result = Int(numberLabel.text ?? "") ?? 0
        sign = "÷"
    }
    
    @IBAction func getResultButton(_ sender: UIButton) {
        switch sign {
        case "+":
            result += Int(numberLabel.text ?? "") ?? 0
        case "-":
            result -= Int(numberLabel.text ?? "") ?? 0
        case "*":
            result *= Int(numberLabel.text ?? "") ?? 0
        case "/" where Int(numberLabel.text ?? "") ?? 0 == 0:
            result = 0
            numberLabel.text = "Ошибка"
        case "/":
            result /= Int(numberLabel.text ?? "") ?? 0
        default:
            result += 0
        }
        
        numberLabel.text = sign == "/" && Int(numberLabel.text ?? "") ?? 0 == 0
            ? "Ошибка"
            : String(result)
    }
    
    @IBAction func getClearResultButton(_ sender: UIButton) {
        result = 0
        numberLabel.text = "0"
    }
}

