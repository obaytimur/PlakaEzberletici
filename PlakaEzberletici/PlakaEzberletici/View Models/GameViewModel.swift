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
    @Published var startingIndex = 10
    
    var topCard: City {
        cards.isEmpty ? Constants.cities.first! : cards[cards.count-1]
    }
    
    var gameState: GameState = .loading
    
    let shuffledCities = Constants.cities.shuffled()
    
    var stats = [GameStatistics]()
    var totalCorrects = 0
    
    enum GameState {
        case loading, playing, submitting, finished
    }
    
    func setupGame() {
        self.gameState = .loading
        
        var delay = 0.0
        for card in shuffledCities.prefix(startingIndex){
            FlipAnimation(animation: .spring, duration: Constants.setupDuration) {
                self.cards.append(card)
            }.playAfter(duration: delay)
            delay += 0.05
        }
        FlipAnimation(duration: Constants.setupDuration) {
            self.setupAnswers()
            self.gameState = .playing
        }.playAfter(duration: delay)
    }
    
    func setupAnswers() {
        self.answers = []
        var newAnswers: [String] = []
        if let index = Constants.cities.firstIndex(where: { $0.name == topCard.name}) {
            if index == 0 {
                newAnswers = [Constants.cities[(index) + 1].name, Constants.cities[(index) + 2].name, Constants.cities[(index) + 3].name]
            } else if index == Constants.cities.count - 1 || index == Constants.cities.count - 2 {
                newAnswers = [Constants.cities[(index) - 3].name, Constants.cities[(index) - 2].name, Constants.cities[(index) - 1].name]
            } else {
                newAnswers = [Constants.cities[(index) - 1].name, Constants.cities[(index) + 1].name, Constants.cities[(index) + 2].name]
            }
        }
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
            self.isGameFinished()
        }.playAfter(duration: Constants.nextCardAnimationLength)
    }
    func isGameFinished() {
        if cards.isEmpty {gameState = .finished}
    }
    func submitAnswer(_ cityName: String) {
        gameState = .submitting
        let isIndexValid = self.shuffledCities.indices.contains(self.startingIndex)
        if isIndexValid {
            self.cards.insert(self.shuffledCities[self.startingIndex], at: 0)
            self.startingIndex += 1
        }
        let answerCorrect = cityName == topCard.name
        if answerCorrect {totalCorrects += 1}
        let statistic = GameStatistics(city: topCard, wasCorrect: answerCorrect)
        stats.append(statistic)
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
