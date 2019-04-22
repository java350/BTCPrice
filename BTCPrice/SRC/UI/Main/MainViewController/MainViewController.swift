//
//  MainViewController.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/20/19.
//  Copyright © 2019 java. All rights reserved.

import UIKit
import Charts

class MainViewController: UIViewController, MainViewPresentable, RootView {

    
    // MARK: -  Properties
    
    typealias ViewType = MainView
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
        
        self.configure()
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
        self.rootView.map {
            $0.lineChartView.data = data
            $0.lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
            $0.lineChartView.animate(xAxisDuration: 0.5)
        }
    }
    
    func updatePrice(with price: Double, for currency: Currency) {
        self.rootView.map {
            $0.labelDate.text = Date().string(with: .fullAlternate)
            $0.labelPrice.text = price.formatted(for: currency)
            navigationItem.title = Coin
                .element(at: $0.segmentedCoin.selectedSegmentIndex)
                .map { $0.description + " " + Constants.Text.price.capitalized }
        }
    }
    
    
    // MARK: -  IBActions
    
    @IBAction func onTime(_ sender: UISegmentedControl) {
        DaysLimit.element(at: (rootView?.segmentedTime.selectedSegmentIndex).default)
            .map {
                self.presenter.changeLimit($0)
        }
    }
    
    @IBAction func onCoin(_ sender: UISegmentedControl) {
        Coin.element(at: (rootView?.segmentedCoin.selectedSegmentIndex).default)
            .map {
                self.presenter.changeCoin($0)
        }
    }
    
    @objc func onRefresh() {
        self.presenter.showChart()
    }
    
    
    // MARK: -  Private methods
    
    private func configure() {
        self.rootView?.configure()
        self.configureNavigationBur()
    }
    
    private func configureNavigationBur() {
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(onRefresh))
        navigationItem.rightBarButtonItems = [refresh]
        navigationItem.title = "Bitcoin Price"
    }
    
}
