//
//  PreloaderView.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import SwiftUI

struct PreloaderView: View {
    @StateObject var vm = PreloaderVM()
    
    var body: some View {
        ZStack {
            NavigationLink("", destination: MainView().navigationBarBackButtonHidden(), isActive: $vm.fullyLoaded)

            VStack {
                Circle()
                    .fill(Color.customGreen)
                    .frame(width: 200, height: 200)
                    .offset(x: 50, y: -100)
                
                Circle()
                    .fill(Color.customRed)
                    .frame(width: 300, height: 300)
                    .offset(x: -50, y: 100)
            }.blur(radius: 80)
            
            ProgressView(value: vm.progress)
                .progressViewStyle(RoundedRectProgressViewStyle())
                .tint(Color.customGreen)
                .padding(.horizontal, 40)
        }.onAppear(perform: vm.startProgress)
            .onDisappear(perform: vm.invalidate)
    }
}

struct PreloaderView_Previews: PreviewProvider {
    static var previews: some View {
        PreloaderView()
            .preferredColorScheme(.dark)
    }
}
