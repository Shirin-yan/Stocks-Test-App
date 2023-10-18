//
//  PreloaderVM.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import Foundation

class PreloaderVM: ObservableObject {
    @Published var progress: CGFloat = 0
    
    func startProgress(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.progress += 0.1
        }
    }
}
