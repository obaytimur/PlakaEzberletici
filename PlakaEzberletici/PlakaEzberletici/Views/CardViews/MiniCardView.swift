//
//  MiniCardView.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 11/01/2024.
//

import SwiftUI

struct MiniCardView: View {
    let city: City
    
    var body: some View {
        FrontCardView(city: city)
            .miniCardView()
    }
}

struct MiniCardView_Previews: PreviewProvider {
    static var previews: some View {
        MiniCardView(city: Constants.cities.first!)
    }
}
