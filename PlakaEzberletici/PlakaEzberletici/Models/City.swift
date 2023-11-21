//
//  Cities.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 21/11/2023.
//

import Foundation

struct City: Codable{
    var plate: Int
    var cityName: String
    var numberAnswers: [Int]
    var stringAnswers: [String]
}
