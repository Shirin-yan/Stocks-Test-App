//
//  DurationTextFieldView.swift
//  Stocks
//
//  Created by Shirin on 19.10.2023.
//

import SwiftUI

struct DurationTextFieldView: View {
    @FocusState private var isFocused: Bool
    @State private var time = "00:01"
    @State var borderColor = Color.darkBlue
    var onChange: (Int)->()
    
    var body: some View {
        VStack {
            Text("Investment")
                .foregroundColor(.customGray)
                .font(.system(size: 12, weight: .medium))

            HStack {
                Button {
                    addSubtract(value: -1)
                } label: {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.customGray)
                }
                     
                TextField(
                    "Enter text",
                    text: $time
                ).focused($isFocused)
                    .textContentType(.dateTime)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .onChange(of: isFocused) { isFocused in
                        borderColor = isFocused ? .customGreen : .darkBlue
                    }.onChange(of: time) { newValue in
                        time = formatTimeInput(newValue)
                    }

                Button {
                    addSubtract(value: 1)
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
    
    private func formatTimeInput(_ input: String) -> String {
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
        let numericString = input.components(separatedBy: allowedCharacterSet.inverted).joined()
        let limitedString = String(numericString.prefix(4))

        let formattedString: String
        if limitedString.count > 2 {
            let index = limitedString.index(limitedString.startIndex, offsetBy: 2)
            let hour = limitedString[..<index]
            let minute = String(min(Int(limitedString[index...]) ?? 0, 59))
            formattedString = "\(hour):\(minute)"
        } else {
            formattedString = limitedString
        }

        return formattedString
    }
    
    func addSubtract(value: Int){
        let res = getSeconds()+value
        time = String(format: "%02i:%02i", res/60, max(res%60, 0))
    }
    
    func getSeconds() -> Int {
        let seconds = Int(time.components(separatedBy: ":").last ?? "") ?? 0
        let minutes = Int(time.components(separatedBy: ":").first ?? "") ?? 0
        return minutes*60+seconds
    }
}

struct DurationTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        DurationTextFieldView(onChange: { _ in
            
        }).preferredColorScheme(.dark)
    }
}

