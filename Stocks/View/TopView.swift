//
//  TopView.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import SwiftUI

struct TopView: View {
    @StateObject var vm = TopVM()
    
    var body: some View {
        VStack {
            Text("Top Traders")
                .foregroundColor(.white)
                .font(.system(size: 22, weight: .bold))
            
            List {
                HStack {
                    Text("No.")
                        .foregroundColor(.customGray)
                        .font(.system(size: 12, weight: .medium))
                        .frame(minWidth: 24, alignment: .leading)
                    
                    Text("Country")
                        .foregroundColor(.customGray)
                        .font(.system(size: 12, weight: .medium))
                        .frame(minWidth: 60, alignment: .leading)

                    Text("Name")
                        .foregroundColor(.customGray)
                        .font(.system(size: 12, weight: .medium))
                        .frame(minWidth: 10, alignment: .leading)
                    
                    Spacer()
                    
                    Text("Deposit")
                        .foregroundColor(.customGray)
                        .font(.system(size: 12, weight: .medium))
                        .frame(minWidth: 70, alignment: .trailing)

                    Text("Profit")
                        .foregroundColor(.customGray)
                        .font(.system(size: 12, weight: .medium))
                        .frame(minWidth: 70, alignment: .trailing)
                }.frame(maxWidth: .infinity)
                    .listRowBackground(Color.darkBlue)
                
                ForEach(vm.data.enumeratedArray(), id: \.offset) { ind, i in
                    TraderItemView(index: ind, data: i)
                        .listRowBackground((ind  % 2 == 0) ? Color(.clear) : Color.darkBlue)
                }
            }.scrollContentBackground(.hidden)

        }.onAppear(perform: vm.generateData)
            .background(Color.bg.ignoresSafeArea())
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
            .preferredColorScheme(.dark)
    }
}
