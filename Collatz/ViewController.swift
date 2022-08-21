//
//  ViewController.swift
//  Collatz
//
//  Created by Sergey Pavlov on 15.08.2022.
//
import Charts
import UIKit

class ViewController: UIViewController, ChartViewDelegate {

  
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var viewForGraph: UIView!
    
    var lineChart = LineChartView()
    var arrayOfValues: [Int] = []
    var entries = [ChartDataEntry]()
    var submitTappes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineChart.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lineChart.frame = viewForGraph.frame
        view.addSubview(lineChart)
        
    }

    @IBAction func sliderChosed(_ sender: UISlider) {
        sender.minimumValue = 2
        sender.maximumValue = 200
        numberLabel.text = String(Int(sender.value))
    }
    @IBAction func submitTapped(_ sender: UIButton) {
        arrayOfValues = []
        entries = []
        submitTappes += 1
        guard var tempValue = Int(numberLabel.text ?? "Error") else { return }
        while tempValue != 1 {
            arrayOfValues.append(tempValue)
            checkValue(value: &tempValue)
        }
        arrayOfValues.append(1)
        for index in 0..<arrayOfValues.count {
            entries.append(ChartDataEntry(x: Double(index), y: Double(arrayOfValues[index])))
        }
        let set = LineChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.colorful()
        let data =  LineChartData(dataSet: set)
        lineChart.data = data
        lineChart.backgroundColor = .lightText
    }
    @IBAction func showBarChartTapped(_ sender: UIButton) {
        if submitTappes < 1 {
            showAlert()
            return
        }
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
                controller.modalPresentationStyle = .fullScreen
                controller.modalTransitionStyle = .flipHorizontal
                self.present(controller, animated: true, completion: nil)
                controller.tempArray = self.arrayOfValues
            }
    @IBAction func showDiagrammTapped(_ sender: UIButton) {
        if submitTappes < 1 {
            showAlert()
            return
        }
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else { return }
                controller.modalPresentationStyle = .fullScreen
                controller.modalTransitionStyle = .flipHorizontal
                self.present(controller, animated: true, completion: nil)
                controller.tempArray = self.arrayOfValues
    }
    
    func checkValue(value: inout Int) {
        if value % 2 == 0 {
            value = value/2
        } else {
            value = value * 3 + 1
        }
    }
}

extension ViewController {
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Please tap submit", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
}
