//
//  ViewController.swift
//  CalculatorAuto
//
//  Created by Assem on 2/22/20.
//  Copyright © 2020 Assem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayResult: UILabel!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
       }
    
    var checkTyping = false
    var dotIsPlaced = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    var currentInput: Double {
        get {
            return Double(displayResult.text!)!
        }
        set {
            displayResult.text = "/(newValue)"
            checkTyping = false;
        }
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        
        if checkTyping {
                displayResult.text = displayResult.text! + number
            
        } else {
            displayResult.text = number
            checkTyping = true
        }
        
    }
    
    @IBAction func twoOperandsPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        checkTyping = false
        print(firstOperand)
        dotIsPlaced = false
    }
    
    @IBAction func percentButtonPressed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
             secondOperand = firstOperand * currentInput / 100
        }
            
    }
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResult.text = "0"
        checkTyping = false
        operationSign = ""
        dotIsPlaced = false
    }
    
    
    @IBAction func squareRootButtonPressed(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        checkTyping = false
    }
    
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if checkTyping && !dotIsPlaced {
            displayResult.text = displayResult.text! + "."
            dotIsPlaced = true
        } else if !checkTyping && !dotIsPlaced {
            displayResult.text = "0."
        }
    }
    
    
    @IBAction func equalityPressed(_ sender: UIButton) {
        if checkTyping {
            secondOperand = currentInput
        }
        
        dotIsPlaced = false
        switch operationSign {
        case "+":
            operateWithTwoOperands{$0 + $1}
        case "-":
            operateWithTwoOperands{$0 - $1}
        case "✕":
            operateWithTwoOperands{$0 * $1}
        case "÷":
            operateWithTwoOperands{$0 / $1}
        default: break;
        }
    }
    
    
    
    
}

