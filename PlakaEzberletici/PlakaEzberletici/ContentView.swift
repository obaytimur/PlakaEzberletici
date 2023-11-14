 //
//  ContentView.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 13/11/2023.
//

import SwiftUI

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
                        .font(.custom("FontNameMono", fixedSize: 70))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 300, height: 200)
                        .background(Rectangle().fill(Color(UIColor.systemBackground)).shadow(radius: 3))
                        .onTapGesture {
                            tapPressed = false
                        }
                }
                else{
                    Text("\(randomInt)")
                        .font(.custom("FontNameMono", fixedSize: 200))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 300, height: 200)
                        .background(Rectangle().fill(Color(UIColor.systemBackground)).shadow(radius: 3))
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
