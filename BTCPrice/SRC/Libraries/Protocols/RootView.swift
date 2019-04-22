//
//  RootView.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/22/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
import UIKit

protocol RootView where Self: UIViewController {
    associatedtype TypeView
    
    var rootView: TypeView? { get }
}

extension RootView {
    var rootView: TypeView? {
        return self.viewIfLoaded as? TypeView
    }
}
