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
            if vm.gameState != .finished {
                ZStack {
                    cardPile
                    flashMarks
                }
                .frame(height: 300)
                answerButtons
            }
            endScreen
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
    @ViewBuilder
    private var answerButtons: some View {
        if vm.gameState == .playing || vm.gameState == .submitting  {
            VStack {
                HStack{
                    answerButton(cityName: vm.answers[0])
                    answerButton(cityName: vm.answers[1])
                }
                HStack {
                    answerButton(cityName: vm.answers[2])
                    answerButton(cityName: vm.answers[3])
                }
            }
            .padding()
        }
    }
    private func answerButton(cityName: String) -> some View {
        Button{
            vm.submitAnswer(cityName)
        } label: {
            Text(cityName)
                .mainViewText()
        }
        .disabled(vm.gameState != .playing)
    }
    @ViewBuilder
    private var flashMarks: some View{
        if vm.gameState == .submitting{
            ZStack{
                Image(systemName: "checkmark.circle.fill")
                    .correct()
                    .opacity(vm.passing ? 1 : 0)
            }
                Image(systemName: "x.circle.fill")
                    .wrong()
                    .opacity(vm.failing ? 1 : 0)
        }
    }
    @ViewBuilder
    private var endScreen: some View {
        if vm.gameState == .finished{
            ScrollView {
                VStack{
                    ForEach(vm.stats) {stat in
                        HStack{
                            Text(stat.city.name)
                                .font(.title)
                            Image(systemName: stat.wasCorrect ? "checkmark.circle" : "x.circle")
                                .foregroundColor(stat.wasCorrect ? .green : .red)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
