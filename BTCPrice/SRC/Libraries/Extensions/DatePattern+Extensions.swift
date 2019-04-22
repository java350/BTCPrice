//
//  DatePattern+Extensions.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/21/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

extension DatePattern {
    
    // General
    
    static var hours: DatePattern {
        return .format("h:mm a")
    }
    
    static var date: DatePattern {
        return .format("yyyy MM dd")
    }
    
    static var dayMounthYear: DatePattern {
        return .format("dd/MM/yyyy")
    }
    
    static var mounthDayYear: DatePattern {
        return .format("MM/dd/yyyy")
    }
    
    static var month: DatePattern {
        return .format("MMMM")
    }
    
    static var year: DatePattern {
        return .format("yyyy")
    }
    
    // Context related
    
    static var price: DatePattern {
        return .format("MM.dd.yy")
    }
    
    static var full: DatePattern {
        return .format("H:mm a MM/dd/yyyy")
    }
    
    static var fullAlternate: DatePattern {
        return .format("MM/dd/yyyy, H:mm a")
    }
    
    static var fullWithMilliseconds: DatePattern {
        return .format("y-MM-dd H:m:ss.SSSS")
    }
}
