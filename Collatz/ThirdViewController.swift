//
//  ThirdViewController.swift
//  Collatz
//
//  Created by Sergey Pavlov on 21.08.2022.
//
import Charts
import UIKit

class ThirdViewController: UIViewController, ChartViewDelegate {

    @IBOutlet var myView: UIView!
    
    var tempArray: [Int] = []
    var pieChart = PieChartView()
    var entries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pieChart.frame = myView.frame
        view.addSubview(pieChart)
        
        for index in 0..<tempArray.count {
            entries.append(PieChartDataEntry(value: Double(index), data: Double(tempArray[index])))
        }
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.colorful() 
        let data = PieChartData(dataSet: set)
        pieChart.data = data
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
