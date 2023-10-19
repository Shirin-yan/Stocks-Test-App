//
//  TradeVM.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import Foundation

class TradeVM: ObservableObject {
    @Published var pair = CurrencyPair(symbol: "GPB", currency: "USD")
    @Published var duration = 1
    @Published var investment = 100
}
