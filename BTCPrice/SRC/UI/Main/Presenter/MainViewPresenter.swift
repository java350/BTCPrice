//
//  MainProtocol.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/21/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

protocol MainViewPresenter {
    init(view: MainView, coin: Coin, currency: Currency, limit: DaysLimit)
    
    func changeCoin(_ coin: Coin )
    func changeLimit(_ limit: DaysLimit)
    func showChart()
}
