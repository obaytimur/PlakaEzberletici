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
    @StateObject var vm = ContentViewModel()
    
    let miniCities: [City] = [
        Constants.cities.randomElement()!,
        Constants.cities.randomElement()!,
        Constants.cities.randomElement()!
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                CardFan(cities: miniCities)
                    .scaleEffect(vm.splashScreenState == .on ? 0.5 : 1)
                if vm.splashScreenState == .on {
                    splashScreen
                } else {
                    mainScreen
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

extension ContentView {
    private var splashScreen: some View {
        VStack {
            ProgressView()
        }
    }
    private var mainScreen: some View {
        VStack {
            mainList
            Spacer()
        }
    }
    private var mainList: some View{
        VStack {
            NavigationLink(destination: GameView() ) {
                Text("Start")
                    .mainViewText()
            }
        }
    }
}
