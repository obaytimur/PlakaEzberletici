//
//  TextStyles.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 12/01/2024.
//

import SwiftUI

extension Text {
    func mainViewText() -> some View{
        self.padding()
            .foregroundStyle(Color(hex: Constants.darkBlue))
            .font(.system(size: 20))
            .bold()
            .frame(maxWidth: UIScreen.main.bounds.width * 0.6)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color(hex: Constants.lightBlue)))
    }
}

extension Image {
    func correct() -> some View {
        self.foregroundColor(.green)
            .fontWeight(.thin)
            .font(.system(size: 200))
    }
    
    func wrong() -> some View {
        self.foregroundColor(.red)
            .fontWeight(.thin)
            .font(.system(size: 200))
    }
}
