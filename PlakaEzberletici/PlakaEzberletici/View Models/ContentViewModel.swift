//
//  ContentViewModel.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 11/01/2024.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var splashScreenState = SplashScreenState.on
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut) {
                self.splashScreenState = .off
            }
        }
        
        let splashAnimation = FlipAnimation(animation: .spring, duration: 1.0) {
            self.splashScreenState = .off
        }
        
        splashAnimation.playAfter(duration: 1.5)
    }
}

enum SplashScreenState {
    case on, off
}
