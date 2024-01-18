//
//  FlipAnimation.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 11/01/2024.
//

import SwiftUI

final class FlipAnimation {
    let animation: AnimationType
    let duration: Double
    let next: FlipAnimation?
    let delay: Double
    var completion: () -> Void
    
    init(animation: AnimationType = .easeInOut, duration: Double, next: FlipAnimation? = nil, delay: Double = 0, completion: @escaping () -> Void) {
        self.animation = animation
        self.duration = duration
        self.next = next
        self.delay = delay
        self.completion = completion
    }
    
    enum AnimationType {
        case easeIn,
             easeOut,
             easeInOut,
             spring
    }
    
    func play() {
        switch animation {
        case .easeIn:
                withAnimation(.easeIn(duration: duration).delay(delay)) {
                    completion()
                }
        case .easeInOut:
            withAnimation(.easeInOut(duration: duration).delay(delay)) {
                completion()
            }
        case .easeOut:
            withAnimation(.easeOut(duration: duration).delay(delay)) {
                completion()
            }
        case .spring:
            withAnimation(.spring(duration: duration).delay(delay)) {
                completion()
            }
        }
        if let nextAni = next {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                nextAni.play()
            }
        }
    }
    
    func playAfter(duration: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.play()
        }
    }
}

