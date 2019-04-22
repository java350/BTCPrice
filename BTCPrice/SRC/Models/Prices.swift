//
//  Prices.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/20/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

struct Prices: Decodable {
    var values: [Double]
    var months: [String]
}
