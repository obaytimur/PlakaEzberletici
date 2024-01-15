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
    @Published var answers = [String]()
    @Published var passing = false
    @Published var failing = false
    
    var topCard: City {
        cards.isEmpty ? Constants.cities.first! : cards[cards.count-1]
    }
    
    var gameState: GameState = .loading
    
    enum GameState {
        case loading, playing, submitting, finished
    }
    
    func setupGame() {
        for card in Constants.cities{
            cards.append(card)
        }
        
        self.gameState = .loading
        setupAnswers()
        self.gameState = .playing
    }
    
    func setupAnswers() {
        self.answers = []
        var newAnswers = topCard.answers
        newAnswers.append(topCard.name)
        
        for answer in newAnswers.shuffled() {
            self.answers.append(answer)
        }
    }
    
    func nextCard() {
        FlipAnimation(duration: Constants.nextCardAnimationLength) {
            self.gameState = .playing
            self.cards.remove(at: self.cards.count-1)
            self.flipped = false
            self.rotation = 0.0
            self.setupAnswers()
        }.playAfter(duration: Constants.nextCardAnimationLength)
    }
    func submitAnswer(_ cityName: String) {
        gameState = .submitting
        
        let answerCorrect = cityName == topCard.name
        flipping()
        flash(passing: answerCorrect)
        nextCard()
    }
    func flash(passing: Bool) {
        let flashOff = FlipAnimation(duration: Constants.flasfAnimationLength, delay: Constants.flasfAnimationLength){
            if passing {self.passing = false} else {self.failing = false}
        }
        let flashOn = FlipAnimation(duration: Constants.flasfAnimationLength, next: flashOff, delay: Constants.flasfAnimationLength) {
            if passing {self.passing = true} else {self.failing = true}
        }
        flashOn.play()
    }
    func flipping() {
        let secondTurn = FlipAnimation(animation: .spring, duration: Constants.halfFlipAnimationLength, next: nil) {
            self.rotation += 90
        }
        let flipView = FlipAnimation(animation: .spring, duration: 0.01, next: secondTurn) {
            self.flipped.toggle()
        }
        let firstTurn = FlipAnimation(animation: .spring, duration: Constants.halfFlipAnimationLength, next: flipView) {
            self.rotation += 90
        }
        firstTurn.play()
    }
}
