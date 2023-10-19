//
//  TradeView.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import SwiftUI

struct TradeView: View {
    @StateObject var vm = TradeVM()
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("Top Traders")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                
                VStack(spacing: 8) {
                    Text("Balance")
                        .foregroundColor(.customGray)
                        .font(.system(size: 12, weight: .medium))
                    
                    Text("10000")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                }.frame(maxWidth: .infinity, minHeight: 50)
                    .padding(.vertical, 10)
                    .background(Color.darkBlue)
                    .cornerRadius(12)

                WebView(url: URL(string: "https://www.tradingview.com/chart/?symbol=\(vm.pair.symbol)")!)
                    .background(Color.clear)
                
                NavigationLink {
                    CurrencyPairView(currentSelected: $vm.pair)
                } label: {
                    Text(vm.pair.text)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .overlay(Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.horizontal, 20))
                        .padding(.vertical, 10)
                        .background(Color.darkBlue)
                        .cornerRadius(12)
                }

                HStack {
                    DurationTextFieldView(onChange: { time in
                        vm.duration = time
                        print("update here")
                    })
                    
                    InvestmentTextFieldView()
                }
                
                HStack {
                    Button {
                        
                    } label: {
                        Text("Sell")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                            .frame(maxWidth: .infinity, minHeight: 54)
                            .background(Color.customRed)
                            .cornerRadius(12)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Buy")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                            .frame(maxWidth: .infinity, minHeight: 54)
                            .background(Color.customGreen)
                            .cornerRadius(12)
                    }
                }
            }.padding(20)
        }
    }
}

struct TradeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TradeView()
                .preferredColorScheme(.dark)
        }
    }
}
