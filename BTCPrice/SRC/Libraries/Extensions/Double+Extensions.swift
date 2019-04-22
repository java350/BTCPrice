//
//  Double+Extensions.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/21/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

extension Double {
    func formatted(for currency: Currency) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale =  Locale(identifier: currency.local)
        
        return currencyFormatter.string(from: NSNumber(value: self))!
    }
    
}
