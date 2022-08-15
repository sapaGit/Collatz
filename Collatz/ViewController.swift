//
//  ViewController.swift
//  Collatz
//
//  Created by Sergey Pavlov on 15.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
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
            resultText += " \(tempValue)"
            checkValue(value: &tempValue)
        }
        resultLabel.text = resultText + " 1"
    }
    func checkValue(value: inout Int) {
        if value % 2 == 0 {
            value = value/2
        } else {
            value = value * 3 + 1
        }
    }
}

