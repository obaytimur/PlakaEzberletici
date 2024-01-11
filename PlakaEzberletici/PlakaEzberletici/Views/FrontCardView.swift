//
//  FrontCardView.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 10/01/2024.
//

import SwiftUI

struct FrontCardView: View {
    
    var city: City
    
    var body: some View {
        ZStack {
            CityPlate
        }.card()
    }
}

struct FrontCardView_Previews: PreviewProvider{
    static var previews: some View{
        FrontCardView(city: Constants.cities.first!)
    }
}

extension FrontCardView {
    
    private var CityPlate: some View {
        Text(Constants.cities[0].plate)
            .font(.custom("ArialRoundedMTBold", fixedSize: 50))
            .fixedSize(horizontal: false, vertical: true)
            .foregroundStyle(Color(hex: 0x354FAB))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .cornerRadius(15)
    }
}
