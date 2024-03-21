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
            .foregroundStyle(Color(hex: Constants.lightBlue))
            .font(.system(size: 20))
            .bold()
            .frame(maxWidth: UIScreen.main.bounds.width * 0.6)
            .cornerRadius(15)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color(hex: Constants.darkBlue)))
    }
}

extension View {
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}

extension Image {
    func correct() -> some View {
        self.foregroundColor(.green)
            .fontWeight(.thin)
            .font(.system(size: 120))
    }
    
    func wrong() -> some View {
        self.foregroundColor(.red)
            .fontWeight(.thin)
            .font(.system(size: 120))
    }
}
