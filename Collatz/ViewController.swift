//
//  ViewController.swift
//  Collatz
//
//  Created by Sergey Pavlov on 15.08.2022.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet var numberLabel: UILabel!
    
    var arrayOfValues: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderChosed(_ sender: UISlider) {
        sender.minimumValue = 2
        sender.maximumValue = 100
        numberLabel.text = String(Int(sender.value))
    }
    @IBAction func submitTapped(_ sender: UIButton) {
        var resultText = ""
        guard var tempValue = Int(numberLabel.text ?? "Error") else { return }
        while tempValue != 1 {
            arrayOfValues.append(tempValue)
            resultText += " \(tempValue)"
            checkValue(value: &tempValue)
        }
        arrayOfValues.append(1)
        print(arrayOfValues)
    }
    func checkValue(value: inout Int) {
        if value % 2 == 0 {
            value = value/2
        } else {
            value = value * 3 + 1
        }
    }
}

