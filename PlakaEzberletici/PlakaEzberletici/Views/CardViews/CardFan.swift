//
//  CardFan.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 11/01/2024.
//

import SwiftUI

struct CardFan: View {
    var cities: [City]
    
    var body: some View {
        VStack {
            appTitle
                .padding(.bottom, 50)
            Text("Trafikte cahilce küfretmeyin \nMemleketine de sövün")
                .padding()
                .foregroundColor(Color(hex: Constants.darkBlue))
                .font(.headline)
                .multilineTextAlignment(.center)
            images
                .padding()
        }
    }
}

struct CardFan_Previews: PreviewProvider {
    static var previews: some View {
        CardFan(cities: [Constants.cities[0], Constants.cities[1], Constants.cities[2]])
    }
}

extension CardFan {
    private var images: some View {
        HStack {
            MiniCardView(city: cities[0])
                .offset(x: UIScreen.main.bounds.width*0.2, y: 20)
                .rotationEffect(Angle(degrees: -10.0), anchor: .bottom)
            MiniCardView(city: cities[1])
            MiniCardView(city: cities[2])
                .offset(x: -UIScreen.main.bounds.width*0.2, y: 20)
                .rotationEffect(Angle(degrees: 10.0), anchor: .bottom)
        }
    }
    
    private var appTitle: some View {
        ZStack {
            Text(Constants.appTitle)
                .offset(y: 70)
                .foregroundStyle(
                    Color(hex: Constants.darkBlue)
                )
                .fontWeight(.heavy)
                .font(.system(size: 60))
        }
    }
}
