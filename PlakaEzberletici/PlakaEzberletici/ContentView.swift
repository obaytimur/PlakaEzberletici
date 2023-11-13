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
    var body: some View {
        VStack {
            Spacer()
            Text("\(randomInt)")
                .font(.custom("FontNameMono", fixedSize: 200))
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: 300, height: 200)
                .background(Rectangle().fill(Color.white).shadow(radius: 3))
            Spacer()
            Button ("New Number") {
                randomInt = Int.random(in: 10..<100)
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
