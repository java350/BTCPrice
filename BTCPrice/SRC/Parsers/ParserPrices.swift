//
//  ParserPrises.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/21/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
import SwiftyJSON

private struct Keys {
    static let data = "Data"
    static let time = "time"
    static let close = "close"
}

class ParserPrices {
    func Parse(json: JSON) -> Prices {
        var prices = Prices(values: [], months: [])
        json[Keys.data]
            .arrayValue
            .forEach { item in
                prices.months.append( item[Keys.time].int.date.string(with: .price))
                prices.values.append( item[Keys.close].double.default)
            }
        
         return prices
    }
}

private extension Optional where Wrapped == Int {
    var date: Date {
        return Date(timeIntervalSince1970: TimeInterval(self.default))
    }
}

