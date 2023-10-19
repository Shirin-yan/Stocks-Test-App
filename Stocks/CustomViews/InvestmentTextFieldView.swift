//
//  InvestmentTextFieldView.swift
//  Stocks
//
//  Created by Shirin on 19.10.2023.
//

import SwiftUI

struct InvestmentTextFieldView: View {
    @FocusState private var isFocused: Bool
    @State private var price = 1
    @State var borderColor = Color.darkBlue
    
    var body: some View {
        VStack {
            Text("Investment")
                .foregroundColor(.customGray)
                .font(.system(size: 12, weight: .medium))

            HStack {
                Button {
                    price -= 1
                } label: {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.customGray)
                }
                                
                TextField(
                    "Enter value",
                    value: $price,
                    formatter: NumberFormatter.currency
                ).focused($isFocused)
                    .multilineTextAlignment(.center)
                    .onChange(of: isFocused) { isFocused in
                        borderColor = isFocused ? .customGreen : .darkBlue
                    }
                
                Button {
                    price += 1
                } label: {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.customGray)
                }
            }
        }.padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(Color.darkBlue)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(borderColor, lineWidth: 1))
            .onTapGesture {
                isFocused.toggle()
            }
    }
}

struct InvestmentTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentTextFieldView()
    }
}
