//
//  MainPresenter.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/21/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

protocol MainViewPresentable: class {
    func updateChart(with prices: Prices)
    func updatePrice(with price: Double, for currency: Currency)
}

class MainPresenter: MainViewPresenter {

    // MARK: -  Properties
    
    weak var view: MainViewPresentable!
    var coin: Coin
    var limit: DaysLimit
    var currency: Currency = .USD
    var prices: Prices?
    var price: Double?
    
    
    // MARK: -  Initializations
    
    required init(view: MainViewPresentable,
                  coin: Coin,
                  currency: Currency,
                  limit: DaysLimit)
    {
        self.view = view
        self.coin = coin
        self.limit = limit
        self.currency = currency
    }
    
    
    // MARK: -  Public methods
    
    func changeCoin(_ coin: Coin ) {
        self.coin = coin
        self.showChart()
    }
    
    func changeLimit(_ limit: DaysLimit) {
        self.limit = limit
        self.showChart()
    }
    
    
    // MARK: -  MainViewPresenter protocol methods
    
    func showChart() {
        
        let downloadGroup = DispatchGroup()
        
        downloadGroup.enter()
        HistoryPriceContext()
            .execute(coin: coin,
                     currency: currency,
                     limit: limit) { [weak self] (prices: Prices, responce, error) in
                        self?.prices = prices
                        downloadGroup.leave()
        }
        
        downloadGroup.enter()
        CurrentPriceContext()
            .execute(coin: coin,
                     currency: currency) { [weak self] (price: Double, responce, error) in
                        self?.price = price
                        downloadGroup.leave()
        }
        
        downloadGroup.notify(queue: DispatchQueue.main) {
            DispatchQueue.main.async {
                self.price.map { self.view.updatePrice(with:$0, for: self.currency) }
                self.prices.map(self.view.updateChart(with:))
            }
        }
    }
}
