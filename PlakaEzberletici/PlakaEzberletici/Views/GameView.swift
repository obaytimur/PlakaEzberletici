//
//  GameView.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 12/01/2024.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var vm = GameViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                cardPile
            }
        }
        .navigationTitle(Constants.appTitle)
        .navigationBarTitleDisplayMode(.large)
        .onAppear() {
            vm.setupGame()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

extension GameView {
    private var cardPile: some View {
        ZStack {
            ForEach(vm.cards.indices, id: \.self) {index in
                cityCard(city: vm.cards[index], isTopCard: index == vm.cards.count-1)
            }
        }
    }
    private func cityCard(city: City, isTopCard: Bool) -> some View {
        cardSides(city: city, isTopCard: isTopCard)
            .transition(.slide)
            .zIndex(isTopCard ? 999 : 0)
            .allowsHitTesting(isTopCard ? true : false)
            .offset(x: isTopCard ? 0 : city.randomOffSet, y: isTopCard ? 0 : city.randomOffSet)
            .rotationEffect(.degrees(isTopCard ? 0 : city.randomOffSet))
    }
    private func cardSides(city: City, isTopCard: Bool) -> some View {
        ZStack{
            FrontCardView(city: city)
                .rotation3DEffect(.degrees(isTopCard ? vm.rotation : 0), axis: (x: 0.0, y: 1.0, z: 0.0))
                .opacity(isTopCard ? vm.flipped ? 0 : 1 : 1)
            BackCardView(city: city)
                .rotation3DEffect(.degrees(isTopCard ? vm.rotation + 180 : 0), axis: (x: 0.0, y: 1.0, z: 0.0))
                .opacity(isTopCard ? vm.flipped ? 1 : 0 : 0)
        }
    }
}
