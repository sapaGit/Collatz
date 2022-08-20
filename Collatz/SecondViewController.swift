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
    var barChart = BarChartView()
    var entries = [BarChartDataEntry]()
    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        barChart.frame = myView.frame
        view.addSubview(barChart)
        for index in 0..<tempArray.count {
            entries.append(BarChartDataEntry(x: Double(index), y: Double(tempArray[index])))
        }
        let set = BarChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.material()
        let data =  BarChartData(dataSet: set)
        barChart.data = data
        barChart.backgroundColor = .lightText
    }
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
