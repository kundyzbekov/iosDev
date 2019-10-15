//
//  ViewController.swift
//  Calculator_mvc
//
//  Created by Еркебулан Кундызбеков on 9/18/19.
//  Copyright © 2019 Еркебулан Кундызбеков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    var inTheMiddleOfTyping : Bool = false
    
    @IBAction func digitButtons(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let display = myLabel.text!
        if inTheMiddleOfTyping{
            myLabel.text = display + digit
        } else {
            myLabel.text = digit
            inTheMiddleOfTyping = true
        }
    }
        var displayValue : Double{
            get {
                return Double(myLabel.text!)!
            }
            set {
                myLabel.text = String(newValue)
            }
        }
        
    
    
    var main = CalcMain()
    
    @IBAction func calculationButton(_ sender: UIButton) {
        if inTheMiddleOfTyping {
            main.setOperand(operand: displayValue)
            inTheMiddleOfTyping = false
        }
        
        if let mathSymbol = sender.currentTitle{
            main.performOperation(symbol: mathSymbol)
        }
        displayValue = main.result
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
}

