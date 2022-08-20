//
//  SecondViewController.swift
//  Collatz
//
//  Created by Sergey Pavlov on 19.08.2022.
//
import Charts
import UIKit

class SecondViewController: UIViewController, ChartViewDelegate {

    @IBOutlet var myView: UIView!
    var tempArray: [Int] = []
    var lineChart = LineChartView()
    var entries = [ChartDataEntry]()
    override func viewDidLoad() {
        super.viewDidLoad()
        lineChart.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lineChart.frame = myView.frame
        view.addSubview(lineChart)
        for index in 0..<tempArray.count {
            entries.append(ChartDataEntry(x: Double(index), y: Double(tempArray[index])))
        }
        let set = LineChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.colorful()
        let data =  LineChartData(dataSet: set)
        lineChart.data = data
        lineChart.backgroundColor = .lightText
    }
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
