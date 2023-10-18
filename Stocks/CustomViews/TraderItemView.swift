//
//  TraderItemView.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import SwiftUI

struct TraderItemView: View {
    var index: Int
    var data: Trader
    
    var body: some View {
        HStack {
            Text("\(index+1)")
                .foregroundColor(.customGray)
                .font(.system(size: 14, weight: .medium))
                .frame(minWidth: 24, alignment: .leading)
            
            Image(data.flag)
                .frame(minWidth: 60, alignment: .leading)

            Text(data.name)
                .foregroundColor(.customGray)
                .font(.system(size: 14, weight: .medium))
                .frame(minWidth: 10, alignment: .leading)
            
            Spacer()
            
            Text("$\(data.deposit)")
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .medium))
                .frame(minWidth: 70, alignment: .trailing)

            Text("$\(data.profit)")
                .foregroundColor(.customGreen)
                .font(.system(size: 14, weight: .medium))
                .frame(minWidth: 70, alignment: .trailing)
        }.frame(maxWidth: .infinity)
    }
}

struct TraderItemView_Previews: PreviewProvider {
    static var previews: some View {
        TraderItemView(index: 0, data: Trader(flag: "flag-1", name: "Jack", deposit: 10, profit: 10000))
            .preferredColorScheme(.dark)
    }
}
