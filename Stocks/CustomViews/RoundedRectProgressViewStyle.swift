//
//  RoundedRectProgressViewStyle.swift
//  Stocks
//
//  Created by Shirin on 18.10.2023.
//

import SwiftUI

struct RoundedRectProgressViewStyle: ProgressViewStyle {
    let width = UIScreen.main.bounds.width-80
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: width, height: 24)
                .foregroundColor(.customGray)
            
            RoundedRectangle(cornerRadius: 12)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * width, height: 24)
                .foregroundColor(.customGreen)
            
            Text("\(Int((configuration.fractionCompleted ?? 0.1)*100))%")
                .font(.system(size: 16, weight: .black))
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding()
    }
}
