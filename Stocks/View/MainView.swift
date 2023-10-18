//
//  MainView.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import SwiftUI

struct MainView: View {
    @State var selectedIndex = 0

    var body: some View {
        TabView(selection: $selectedIndex) {
            TradeView()
                .tabItem({
                    Label("Trade", systemImage: "chart.bar.fill")
                })
                .tag(0)
            
            TopView()
                .tabItem({
                    Label("Top", systemImage: "person.fill")
                })
                .tag(1)
        }.background(Color.bg)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
