//
//  MainView.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import SwiftUI

struct MainView: View {
    @State var selectedIndex = 0

    init() {
        UITabBar.appearance().isTranslucent = false
    }
    
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
        }.background(Color.bg.ignoresSafeArea())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
