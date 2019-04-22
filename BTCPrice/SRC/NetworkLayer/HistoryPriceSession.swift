//
//  HistoryPriceSession.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/20/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
import SwiftyJSON

class HistoryPriceContext {
    
    typealias CompletionHandler = ((Prices, URLResponse?, Error?) -> Void)?
    
    func execute(coin: Coin,
                 currency: Currency,
                 limit: DaysLimit,
                 completionHandler: CompletionHandler)
    {
        
        guard let url = URL(string: Constants.Server.apiHistoryPrice) else {
            return
        }
        
        let par = RequestParameters(url: url,
                                    method: .get,
                                    headers: nil,
                                    parameters: [Constants.Server.key.fsym : coin.rawValue,
                                                 Constants.Server.key.tsym : currency.rawValue,
                                                 Constants.Server.key.limit: limit.string])
        URLSession
            .shared
            .dataTask(with: par) { (data, response, error) in
                data.map {
                    let json = JSON.init($0)
                    let prices = ParserPrices().Parse(json: json)
                    completionHandler?(prices, response, error)
                }
            }.resume()
    }
}
