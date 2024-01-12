//
//  GameViewModel.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 12/01/2024.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var cards = [City]()
    @Published var flipped = false
    @Published var rotation: CGFloat = 0
    
    func setupGame() {
        for card in Constants.cities {
            cards.append(card)
        }
    }
}
