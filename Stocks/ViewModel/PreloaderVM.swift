//
//  PreloaderVM.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import Foundation

class PreloaderVM: ObservableObject {
    @Published var progress: CGFloat = 0
    @Published var fullyLoaded = false
    var timer: Timer?
    
    func startProgress(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    @objc func tick(){
        progress = min(1, progress+0.1)
        if progress >= 1 {
            fullyLoaded = true
            invalidate()
        }
    }
    
    func invalidate(){
        timer?.invalidate()
        timer = nil
    }
}
