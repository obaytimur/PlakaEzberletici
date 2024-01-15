//
//  Plakalar.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 13/11/2023.
//

import Foundation

let plakalar: [String: String] = [
        "01": "Adana",
        "02": "Adıyaman",
        "03": "Afyonkarahisar",
        "04": "Ağrı",
        "05": "Amasya",
        "06": "Ankara",
        "07": "Antalya",
        "08": "Artvin",
        "09": "Aydın",
        "10": "Balıkesir",
        "11": "Bilecik",
        "12": "Bingöl",
        "13": "Bitlis",
        "14": "Bolu",
        "15": "Burdur",
        "16": "Bursa",
        "17": "Çanakkale",
        "18": "Çankırı",
        "19": "Çorum",
        "20": "Denizli",
        "21": "Diyarbakır",
        "22": "Edirne",
        "23": "Elazığ",
        "24": "Erzincan",
        "25": "Erzurum",
        "26": "Eskişehir",
        "27": "Gaziantep",
        "28": "Giresun",
        "29": "Gümüşhane",
        "30": "Hakkari",
        "31": "Hatay",
        "32": "Isparta",
        "33": "Mersin",
        "34": "Istanbul",
        "35": "Izmir",
        "36": "Kars",
        "37": "Kastamonu",
        "38": "Kayseri",
        "39": "Kırklareli",
        "40": "Kırşehir",
        "41": "Kocaeli",
        "42": "Konya",
        "43": "Kütahya",
        "44": "Malatya",
        "45": "Manisa",
        "46": "Kahramanmaraş",
        "47": "Mardin",
        "48": "Muğla",
        "49": "Muş",
        "50": "Nevşehir",
        "51": "Niğde",
        "52": "Ordu",
        "53": "Rize",
        "54": "Sakarya",
        "55": "Samsun",
        "56": "Siirt",
        "57": "Sinop",
        "58": "Sivas",
        "59": "Tekirdağ",
        "60": "Tokat",
        "61": "Trabzon",
        "62": "Tunceli",
        "63": "Şanlıurfa",
        "64": "Uşak",
        "65": "Van",
        "66": "Yozgat",
        "67": "Zonguldak",
        "68": "Aksaray",
        "69": "Bayburt",
        "70": "Karaman",
        "71": "Kırıkkale",
        "72": "Batman",
        "73": "Şırnak",
        "74": "Bartın",
        "75": "Ardahan",
        "76": "Iğdır",
        "77": "Yalova",
        "78": "Karabük",
        "79": "Kilis",
        "80": "Osmaniye",
        "81": "Düzce",
        "82": "Kerkük",
        "83": "Musul",
        "84": "Süleymaniye",
        "85": "Batum",
        "86": "Halep",
        "87": "Rakka",
        "88": "Deyziyor",
        "89": "Kıbrıs",
        "90": "Rodos",
        "91": "Gümülçine",
        "92": "Dedeağac",
        "93": "Girit",
        "94": "Selanik",
        "95": "Nahçıvan",
        "96": "Kamışlı",
        "97": "Kırım",
        "98": "Erivan"
]

struct City: Codable{
    var name: String
    var plate: String
    var answers: [String]
    let randomOffSet = Double.random(in: -10.0...10.0)
}

struct GameStatistics: Identifiable {
    let id = UUID()
    let city: City
    let wasCorrect: Bool
}

enum Constants {
    static let cities = [
        City(name: "Adana", plate: "01", answers: ["Adıyaman", "Afyon", "Ağrı"]),
        City(name: "Adıyaman", plate: "02", answers: ["Adana", "Afyon", "Ağrı"]),
        City(name: "Afyon", plate: "03", answers: ["Adıyaman", "Ağrı", "Amasya"]),
        City(name: "Ağrı", plate: "04", answers: ["Afyon", "Amasya", "Ankara"]),
        City(name: "Amasya", plate: "05", answers: ["Ağrı", "Ankara", "Antalya"]),
        City(name: "Ankara", plate: "06", answers: ["Amasya", "Antalya", "Artvin"])
    ]
    
    static let cardHeight: CGFloat = 200
    static let cardWidth: CGFloat = 300
    
    static let miniCardHeight: CGFloat = 200
    static let miniCardWidth: CGFloat = 100
    
    static let appTitle = "Plakalar"
    static let nextCardAnimationLength = 1.0
    static let cardFlipAnimationLength: Double = 0.4
    static var halfFlipAnimationLength: Double { Constants.cardFlipAnimationLength / 2 }
    static let flasfAnimationLength: Double = 0.33
}
