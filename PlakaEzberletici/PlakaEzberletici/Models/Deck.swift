//
//  Deck.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 21/11/2023.
//

import Foundation

struct Deck: Codable{
    var name: String
    var cityPlates: [Int]
    var cities: [City] {
        Constants.cities.filter(<#T##isIncluded: (City) throws -> Bool##(City) throws -> Bool#>){ cityPlates.contains($0.id) }  
    }
}
