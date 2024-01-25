//
//  TrPlateView.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 25/01/2024.
//

import SwiftUI

struct TrPlateView: View {
    var body: some View {
        HStack {
            Text("TR")
                .frame(width: 30, height: 45)
                .background(RoundedRectangle(cornerRadius: 0).fill(.blue))
                .padding(.leading, -34)
            Text("34 ABC 1234")
                .bold()
                .font(.system(size: 20))
                .padding(.leading, 0)
        }
        .frame(width: 200, height: 50)
        .background(RoundedRectangle(cornerRadius: 3).stroke(.black, lineWidth: 5))
    }
}

#Preview {
    TrPlateView()
}
