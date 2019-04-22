//
//  URLResponce+Extensions.swift
//  SearchGiphy
//
//  Created by Lisogonych Volodymyr on 1/23/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

extension URLResponse {
    
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
    
    func isSuccessCode(_ statusCode: Int) -> Bool {
        return statusCode >= 200 && statusCode < 300
    }
    
    func isSuccessCode() -> Bool {
        guard let statusCode = getStatusCode() else {
            return false
        }
        return isSuccessCode(statusCode)
    }
}
