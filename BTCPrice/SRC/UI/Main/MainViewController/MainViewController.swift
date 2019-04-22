//
//  MainViewController.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/20/19.
//  Copyright © 2019 java. All rights reserved.

import UIKit
import Charts

class MainViewController: UIViewController, MainView {

   
    // MARK: -  IBLabels
    
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var segmentedTime: UISegmentedControl!
    @IBOutlet weak var segmentedCoin: UISegmentedControl!
    
    
    // MARK: -  Properties
    
    var presenter: MainViewPresenter!

    
    // MARK:  Initializations
    
    init() {
        super.init(nibName: String(describing: MainViewController.self) , bundle: nil)
        
        self.presenter = MainPresenter(view: self, coin: .BTC, currency: .USD, limit: .week)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        self.configureNavigationBur()
        self.presenter.showChart()
    }
    
    
    // MARK: -  protocols methods
    
    func updateChart(with prices: Prices) {
        
        let moneys = prices.values
        let months = prices.months
        var yValues : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< months.count {
            yValues.append(ChartDataEntry(x: Double(i), y: moneys[i]))
        }
        
        let data = LineChartData()
        let ds = LineChartDataSet(values: yValues, label: nil)
        ds.circleRadius = 0
        ds.lineWidth = 3
        ds.colors = [.purple]
        data.addDataSet(ds)
        self.lineChartView.data = data
        
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        lineChartView.animate(xAxisDuration: 0.5)
    }
    
    func updatePrice(with price: Double, for currency: Currency) {
        self.labelDate.text = Date().string(with: .fullAlternate)
        self.labelPrice.text = price.formatted(for: currency)
        navigationItem.title = Coin
            .element(at: segmentedCoin.selectedSegmentIndex)
            .map { $0.description + " " + Constants.Text.price.capitalized }
    }
    
    
    // MARK: -  IBActions
    
    @IBAction func onTime(_ sender: UISegmentedControl) {
        DaysLimit.element(at: segmentedTime.selectedSegmentIndex)
            .map {
                self.presenter.changeLimit($0)
        }
    }
    
    @IBAction func onCoin(_ sender: UISegmentedControl) {
        Coin.element(at: segmentedCoin.selectedSegmentIndex)
            .map {
                self.presenter.changeCoin($0)
        }
    }
    
    @objc func onRefresh() {
        self.presenter.showChart()
    }
    
    
    // MARK: -  Private methods
    
    private func configureView() {
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.legend.enabled = false
        lineChartView.doubleTapToZoomEnabled = false
        lineChartView.backgroundColor = .white
        lineChartView.rightAxis.drawAxisLineEnabled = false
        lineChartView.rightAxis.drawLabelsEnabled = false
    }
    
    private func configureNavigationBur() {
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(onRefresh))
        navigationItem.rightBarButtonItems = [refresh]
        navigationItem.title = "Bitcoin Price"
    }
    
}
