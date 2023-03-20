//
//  ViewController.swift
//  TestProject
//
//  Created by Vsevolod Lashin on 16.03.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var rightButton: UIButton!
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var clearButton: UIButton!
    
    private var count = 0
    private var result = 0
    private var sign = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
    }
    
    @IBAction func getHigherNumberButton(_ sender: UIButton) {
        numberLabel.text = String(count + 1)
        count += 1
    }
    
    @IBAction func getLowerNumberButton(_ sender: UIButton) {
        numberLabel.text = String(count - 1)
        count -= 1
    }
    
    @IBAction func getPlusButton(_ sender: UIButton) {
        result = Int(numberLabel.text ?? "") ?? 0
        sign = "+"
        count = 0
    }
    
    @IBAction func getMinusButton(_ sender: UIButton) {
        result = Int(numberLabel.text ?? "") ?? 0
        sign = "-"
        count = 0
    }
    
    @IBAction func getMultiplyButton(_ sender: UIButton) {
        result = Int(numberLabel.text ?? "") ?? 0
        sign = "*"
        count = 0
    }
    
    @IBAction func getDivisionButton(_ sender: UIButton) {
        result = Int(numberLabel.text ?? "") ?? 0
        sign = "/"
        count = 0
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
        count = result
    }
    
    @IBAction func getClearResultButton(_ sender: UIButton) {
        result = 0
        count = 0
        numberLabel.text = "0"
    }
}

