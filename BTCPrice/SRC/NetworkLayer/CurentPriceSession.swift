//
//  HistoryPriceSession.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/20/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
import SwiftyJSON

class CurrentPriceContext {
    
    typealias CompletionHandler = ((Double, URLResponse?, Error?) -> Void)?
    
    func execute(coin: Coin,
                 currency: Currency,
                 completionHandler: CompletionHandler)
    {
        
        guard let url = URL(string: Constants.Server.apiPrice) else {
            return
        }
        
        let par = RequestParameters(url: url,
                                    method: .get,
                                    headers: nil,
                                    parameters: [Constants.Server.key.fsym : coin.rawValue,
                                                 Constants.Server.key.tsyms : currency.rawValue]
        )
        URLSession
            .shared
            .dataTask(with: par) { (data, response, error) in
                data.map {
                    let json = JSON.init($0)
                    completionHandler?(json[currency.rawValue].double.default,
                                       response, error)
                }
            }.resume()
    }
}
