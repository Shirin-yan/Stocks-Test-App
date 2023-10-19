//
//  CurrencyPairView.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import SwiftUI

struct CurrencyPairView: View {
    @Environment(\.presentationMode) var presentation
    @StateObject var vm = CurrencyPairVM()
    @Binding var currentSelected: CurrencyPair

    var body: some View {
        ScrollView {
            let rows = [
                GridItem(.adaptive(minimum: 100)),
                GridItem(.adaptive(minimum: 100)),
            ]

            LazyVGrid(columns: rows, alignment: .center, spacing: 20, content: {
                ForEach(vm.data.enumeratedArray(), id: \.offset) { ind, i in
                    Button {
                        currentSelected = i
                        presentation.wrappedValue.dismiss()
                    } label: {
                        Text(i.text)
                            .frame(maxWidth: .infinity)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(20)
                            .background(i.text != currentSelected.text ? Color.darkBlue : Color.customGreen)
                            .cornerRadius(10)
                    }.padding(.horizontal, 10)
                }
            }).padding(.horizontal, 10)
        }.onAppear(perform: vm.generateData)
            .background(Color.bg.ignoresSafeArea())
            .navigationTitle("Currency Pair")
    }
}

//struct CurrencyPairView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrencyPairView()
//            .preferredColorScheme(.dark)
//    }
//}
