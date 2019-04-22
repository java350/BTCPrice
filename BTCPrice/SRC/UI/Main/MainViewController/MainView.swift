//
//  MainView.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/22/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit
import Charts

class MainView: UIView {

    // MARK: -  Properties
    
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var segmentedTime: UISegmentedControl!
    @IBOutlet weak var segmentedCoin: UISegmentedControl!
    
    
    // MARK: -  Public methods
    
    func configure() {
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.legend.enabled = false
        lineChartView.doubleTapToZoomEnabled = false
        lineChartView.backgroundColor = .white
        lineChartView.rightAxis.drawAxisLineEnabled = false
        lineChartView.rightAxis.drawLabelsEnabled = false
    }

}
