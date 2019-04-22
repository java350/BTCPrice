//
//  Constants.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/20/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

struct Constants {
    struct Server {
        static let api = "https://min-api.cryptocompare.com/data/"
        static let apiHistoryPrice = Constants.Server.api + Constants.Server.key.histoday
        static let apiPrice = Constants.Server.api + Constants.Server.key.price
        
        struct key {
            static let price    = "price?"
            static let histoday = "histoday?"
            static let fsym     = "fsym"
            static let tsyms    = "tsyms"
            static let tsym     = "tsym"
            static let limit    = "limit"
        }
    }
    
    struct Text {
        static let price = "price"
    }
    
    struct PhotoHistory {
        static let maxElement = 5
        static let saveKey = "searchHistory"
    }
}

enum Currency: String {
    case USD = "USD"
    case EUR = "EUR"
    
    var local: String {
        switch self {
        case .USD: return "en_US"
        case .EUR: return "en_GB"
        }
    }
}

enum Coin: String {
    case BTC = "BTC"
    case LTC = "LTC"
    
    static func element(at index: Int) -> Coin? {
        let elements = [BTC, LTC]
        
        if index >= 0 && index < elements.count {
            return elements[index]
        }
        
        return nil
    }
    
    var description: String {
        switch self {
        case .BTC: return "Bitcoin"
        case .LTC: return "Litecoin"
        }
    }
}

enum DaysLimit: Int {
    case week  = 7
    case month = 30
    case year  = 365
    case all   = 2000
    
    var value: Int {
        return self.rawValue
    }
    
    var string: String {
        return String(self.rawValue)
    }
    
    static func element(at index: Int) -> DaysLimit? {
        let elements = [week, month, year, all]
        
        if index >= 0 && index < elements.count  {
            return elements[index]
        }
        
        return nil
    }
}
