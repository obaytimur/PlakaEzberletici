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
    }
}

enum SplashScreenState {
    case on, off
}
