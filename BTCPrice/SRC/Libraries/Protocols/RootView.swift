//
//  RootView.swift
//  BTCPrice
//
//  Created by Volodymyr on 4/22/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

protocol RootView: class {
    associatedtype ViewType: UIView
    var rootView: ViewType? { get }
}

extension RootView where Self: UIViewController {
    var rootView: ViewType? {
        return self.viewIfLoaded as? ViewType
    }
}
