//
//  NumberFormatter.swift
//  Stocks
//
//  Created by Shirin on 19.10.2023.
//

import Foundation

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}
