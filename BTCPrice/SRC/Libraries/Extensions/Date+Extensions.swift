//
//  Extensions+Date.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/21/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation


public enum DatePattern {
    case format(String)
    
    func dateFormatter() -> DateFormatter {
        return DateFormatter.dateFormatter(with: self)
    }
}

extension Date {
    func string(with datePattern: DatePattern) -> String {
        return datePattern.dateFormatter().string(from: self)
    }
}

fileprivate extension DateFormatter {
    static func dateFormatter(with  format: DatePattern) -> DateFormatter {
        let formatter = DateFormatter()
        //formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale(identifier: "en_US")
        switch format {
        case .format(let pattern):
            formatter.dateFormat = pattern
        }
        return formatter
    }
}
