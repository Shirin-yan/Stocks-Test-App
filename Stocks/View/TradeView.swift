//
//  TradeView.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import SwiftUI

struct TradeView: View {
    @StateObject var vm = TradeVM()
    @State var soldAlertPresented = false
    @State var boughtAlertPresented = false

    var body: some View {
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
                    soldAlertPresented.toggle()
                } label: {
                    Text("Sell")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                        .frame(maxWidth: .infinity, minHeight: 54)
                        .background(Color.customRed)
                        .cornerRadius(12)
                }.alert(isPresented: $soldAlertPresented, content: {
                    Alert(title: Text("Sold"), message: Text("Sold successfully"))
                })
                
                Button {
                    boughtAlertPresented.toggle()
                } label: {
                    Text("Buy")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                        .frame(maxWidth: .infinity, minHeight: 54)
                        .background(Color.customGreen)
                        .cornerRadius(12)
                }.alert(isPresented: $boughtAlertPresented, content: {
                    Alert(title: Text("Bought"), message: Text("Bought successfully"))
                })
            }
        }.padding(20)
            .scrollDismissesKeyboard(.immediately)
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
