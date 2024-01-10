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
            .frame(width: Constans.cardWidth, height: Constans.cardHeight)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color(hex: 0xD7DCEE)))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black .opacity(0.3), radius: 5, x: 0, y: 1)
    }
}

extension View {
    func card() -> some View {
        modifier(CardModifier())
    }
}
