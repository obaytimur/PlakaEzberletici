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
    var body: some View {
        VStack {
            Spacer()
            if let cityName = plakalar[String(randomInt)]{
                if tapPressed {
                    Text("\(cityName)")
                        .font(.custom("ArialRoundedMTBold", fixedSize: 60))
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundStyle(Color(hex: 0x354FAB))
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 300, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .background(Color(hex: 0xD7DCEE).shadow(radius: 5))                        .onTapGesture {
                            tapPressed = false
                        }
                }
                else{
                    Text("\(randomInt)")
                        .font(.custom("ArialRoundedMTBold", fixedSize: 150))
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundStyle(Color(hex: 0x354FAB))
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 300, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .background(Color(hex: 0xD7DCEE).shadow(radius: 5))
                        .onTapGesture {
                            tapPressed = true
                        }
                }
            }
            Spacer()
            Button ("New Number") {
                randomInt = Int.random(in: 10..<100)
                tapPressed = false
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
