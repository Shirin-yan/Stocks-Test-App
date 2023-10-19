//
//  CurrencyPairVM.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import Foundation

class CurrencyPairVM: ObservableObject {
    @Published var data: [CurrencyPair] = []
    
    func generateData(){
        data = [
            CurrencyPair(symbol: "GPB", currency: "USD"),
            CurrencyPair(symbol: "TSLA", currency: "USD"),
            CurrencyPair(symbol: "AAPL", currency: "USD"),
            CurrencyPair(symbol: "NFLX", currency: "USD"),
        ]
    }
}
