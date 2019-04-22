//
//  Optional+Extensions.swift
//  SearchGiphy
//
//  Created by java on 11/26/18.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    var `default`: String {
        return self ?? ""
    }
}

extension Optional where Wrapped == Int {
    var `default`: Int {
        return self ?? 0
    }
}

extension Optional where Wrapped == Double {
    var `default`: Double {
        return self ?? 0.00
    }
}

extension Optional where Wrapped == Bool {
    var `default`: Bool {
        return self ?? true
    }
}

extension Optional {
    var isEmpty: Bool {
        return self == nil
    }
}
