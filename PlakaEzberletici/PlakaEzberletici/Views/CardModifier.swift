//
//  CardModifier.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 10/01/2024.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: Constants.cardWidth, height: Constants.cardHeight)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color(hex: 0xD7DCEE)))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black .opacity(0.3), radius: 5, x: 0, y: 1)
    }
}

struct MiniCardViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: Constants.miniCardWidth, height: Constants.miniCardHeight)
            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.3), radius: 5, x: 0, y: 1)
    }
}

extension View {
    func card() -> some View {
        modifier(CardModifier())
    }
    func miniCardView() -> some View {
        modifier(MiniCardViewModifier())
    }
}
