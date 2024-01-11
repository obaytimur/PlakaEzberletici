//
//  CityCardView.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 11/01/2024.
//

import SwiftUI

struct CityCardView: View {
    
    let city: City
    
    @State var flipped = false
    @State var rotation: CGFloat = 0
    
    var body: some View {
        ZStack {
            FrontCardView(city: city)
                .rotation3DEffect(.degrees(rotation), axis: (x: 0.0, y: 1.0, z: 0.0))
                .opacity(flipped ? 0 : 1)
            BackCardView(city: city)
                .rotation3DEffect(.degrees(rotation + 180), axis: (x: 0.0, y: 1.0, z: 0.0))
                .opacity(flipped ? 1 : 0)
        }
        .onTapGesture {
            flip()
        }
        .padding()
    }
    
    func flip() {
        let secondTurn = FlipAnimation(duration: 0.2, next: nil) {
            rotation += 90
            print("Finish Turn")
        }
        let flipView = FlipAnimation(duration: 0.2, next: secondTurn) {
            flipped.toggle()
        }
        let firstTurn = FlipAnimation(duration: 0.2, next: flipView) {
            rotation += 90
            print("Half Turn")
        }
        firstTurn.play()
    }
}

struct CityCardView_Previews: PreviewProvider {
    static var previews: some View {
        CityCardView(city: Constants.cities[0])
    }
}
