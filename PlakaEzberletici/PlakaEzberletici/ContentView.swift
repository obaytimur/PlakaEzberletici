 //
//  ContentView.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 13/11/2023.
//

import SwiftUI

extension Color {
    init(hex: UInt) {
        self.init(
            red: Double((hex & 0xFF0000) >> 16) / 255.0,
            green: Double((hex & 0x00FF00) >> 8) / 255.0,
            blue: Double(hex & 0x0000FF) / 255.0
        )
    }
}


struct ContentView: View {
    @State private var randomInt = Int.random(in: 10..<100)
    @State private var size = 300.0
    @State private var tapPressed = false
    @State private var isDarkMode = false
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        VStack {
            Spacer()
            if let cityName = plakalar[String(randomInt)]{
                    VStack{
                        Text("\(randomInt)")
                            .font(.custom("ArialRoundedMTBold", fixedSize: 150))
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundStyle(colorScheme == .dark ? Color(hex: 0x354FAB) : Color(hex: 0xD7DCEE))
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 250, height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .background(colorScheme == .dark ? Color(hex: 0xD7DCEE) : Color(hex: 0x354FAB))
                            .cornerRadius(15)
                            .onTapGesture {
                                tapPressed = !tapPressed
                            }
                            .overlay(
                                Spacer()
                                    .frame(height: 100)
                            )
                            Text("\(cityName)")
                                .opacity(tapPressed ? 1 : 0)
                                .font(.custom("ArialRoundedMTBold", fixedSize: 50))
                                .fixedSize(horizontal: false, vertical: true)
                                .foregroundStyle(colorScheme == .dark ? Color(hex: 0xD7DCEE) : Color(hex: 0x354FAB))
                                .multilineTextAlignment(.center)
                                .onTapGesture {
                                    tapPressed = false
                                }
                    }
            }
            Spacer()
            Button ("New Number") {
                randomInt = Int.random(in: 10..<100)
                tapPressed = false
            }
        }
        .frame(maxWidth: .infinity)
        .background(colorScheme == .dark ? Color(hex: 0x354FAB) : Color(hex: 0xD7DCEE))
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
