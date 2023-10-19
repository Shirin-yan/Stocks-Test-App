//
//  CurrencyPair.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import Foundation

struct CurrencyPair {
    var symbol: String
    var currency: String
    
    var text: String {
        return symbol+"/"+currency
    }
}
