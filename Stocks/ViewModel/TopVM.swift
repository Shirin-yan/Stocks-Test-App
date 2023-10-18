//
//  TopVM.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import Foundation

class TopVM: ObservableObject {
    @Published var data: [Trader] = []
    
    func updateData(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
            let randomTraderInd = Int.random(in: 0..<10)
            var randomTrader = data[randomTraderInd]
            randomTrader.deposit += Int.random(in: -150..<150)
            randomTrader.profit += Int.random(in: -150..<150)
            data[randomTraderInd] = randomTrader
        }
    }
    
    func generateData(){
        if !data.isEmpty { return }
        
        data.append(contentsOf: [
            Trader(flag: "flag-1", name: "Madison", deposit: 2367, profit: 336755),
            Trader(flag: "flag-2", name: "Daniel", deposit: 1175, profit: 148389),
            Trader(flag: "flag-3", name: "Timothy", deposit: 1000, profit: 113888),
            Trader(flag: "flag-4", name: "Harry", deposit: 999, profit: 36755),
            Trader(flag: "flag-5", name: "Clear", deposit: 888, profit: 18389),
            Trader(flag: "flag-6", name: "Violet", deposit: 777, profit: 12000),
            Trader(flag: "flag-7", name: "Jack", deposit: 666, profit: 11111),
            Trader(flag: "flag-8", name: "Anna", deposit: 555, profit: 9988),
            Trader(flag: "flag-9", name: "Jacob", deposit: 444, profit: 8877),
            Trader(flag: "flag-10", name: "Derek", deposit: 333, profit: 6652)
        ])
        
        updateData()
    }
}
