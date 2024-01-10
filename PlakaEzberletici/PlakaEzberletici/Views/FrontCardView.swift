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
            CityName
        }.card()
    }
}

struct FrontCardView_Previews: PreviewProvider{
    static var previews: some View{
        FrontCardView(city: Constans.cities.first!)
    }
}

extension FrontCardView {
    
    private var CityName: some View {
        Text(Constans.cities[0].name)
            .font(.custom("ArialRoundedMTBold", fixedSize: 50))
            .fixedSize(horizontal: false, vertical: true)
            .foregroundStyle(Color(hex: 0x354FAB))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .cornerRadius(15)
    }
}
