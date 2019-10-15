//
//  ViewController.swift
//  calculator
//
//  Created by Еркебулан Кундызбеков on 9/10/19.
//  Copyright © 2019 Еркебулан Кундызбеков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Int = 0;
    var prevNumber:Int = 0;
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true{
            myLabel.text = String(sender.tag-1)
            numberOnScreen = Int(myLabel.text!)!
            performingMath = false
        }
        else {
            myLabel.text = myLabel.text! + String(sender.tag-1)
            numberOnScreen = Int(myLabel.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if myLabel.text != "" && sender.tag != 11 && sender.tag != 16{
            
            prevNumber = Int(myLabel.text!)!
            if sender.tag == 12{ //div
                myLabel.text = "/";
                
            }
            else if sender.tag == 13{ //mul
                myLabel.text = "*";
            }
            else if sender.tag == 14{ //sub
                myLabel.text = "-";
            }
            else if sender.tag == 15{ //add
                myLabel.text = "+";
            }
            else if sender.tag == 17{ //percent
                myLabel.text = "%";
            }
            operation = sender.tag
            performingMath = true
        }
        
        else if sender.tag == 16 {
            if operation == 12{
                myLabel.text = String(prevNumber / numberOnScreen)
            }
            else if operation == 13{
                myLabel.text = String(prevNumber * numberOnScreen)
            }
            else if operation == 14{
                myLabel.text = String(prevNumber - numberOnScreen)
            }
            else if operation == 15{
                myLabel.text = String(prevNumber + numberOnScreen)
            }
            else if operation == 17{
                myLabel.text = String(numberOnScreen/100)
            }
            
        }
            
        
        else if sender.tag == 11 {
            myLabel.text = ""
            prevNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

