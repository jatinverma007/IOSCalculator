//
//  ViewController.swift
//  Calculator
//
//  Created by Jatin Verma on 2/23/16.
//  Copyright © 2016 Jatin Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UITextField!
    
    var firstNumber:Double = 0.0
    var secondNumber:Double = 0.0
    var isTypingNumber = false
    var operation:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func digitPressed(sender: UIButton) {
        
        
        
        if(isTypingNumber)
        {
        label.text = label.text! + sender.currentTitle!
        }
        else
        {
            label.text = sender.currentTitle!
        }
        isTypingNumber = true
        
    
    }
    
    @IBAction func clear(sender: UIButton) {
        firstNumber = 0.0
        secondNumber = 0.0
        isTypingNumber = false
        label.text = ""
    }
    @IBAction func methodToBePerformed(sender: UIButton) {
        isTypingNumber = false
        
    firstNumber = (NSNumberFormatter().numberFromString(label.text!)?.doubleValue)! ?? 0.0
        
        operation = sender.currentTitle!
        
        
        
    }
    
    @IBAction func backSpaceFunction(sender: UIButton) {
        let name:String = self.label.text!
        let count = name.characters.count
        let substringIndex = count - 1
        label.text = (name as NSString).substringToIndex(substringIndex)
    }
    
    @IBAction func resultAction(sender: UIButton) {
        isTypingNumber = false
        var result:Double?
        
        if (operation != nil)
        {
        
                secondNumber = (NSNumberFormatter().numberFromString(label.text!)?.doubleValue)!
                //print(secondNumber)
                if (operation == "+")
                {
                    result = firstNumber + secondNumber
                }
                else if(operation == "-")
                {
                    result = firstNumber - secondNumber
                }
                else if(operation == "x")
                {
                    result = firstNumber * secondNumber
                }
                else if (operation == "/")
                {
                    result = firstNumber / secondNumber
                }
                else if(operation == "%")
                {
                    result = firstNumber % secondNumber
                }
                label.text = "\(result!)"
                firstNumber = 0.0
                operation = nil
        }
    }
}


