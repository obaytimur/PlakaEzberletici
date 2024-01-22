//
//  BackCardView.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 10/01/2024.
//

import SwiftUI

struct BackCardView: View {
    
    let city: City
    
    var body: some View {
        VStack {
            Text("\(city.name)")
                .font(.custom("ArialRoundedMTBold", fixedSize: 50))
                .foregroundStyle(Color(hex: Constants.darkBlue))
        }.card()
    }
}

struct BackCardView_Preview: PreviewProvider {
    static var previews: some View{
        BackCardView(city: Constants.cities.first!)
    }
}
