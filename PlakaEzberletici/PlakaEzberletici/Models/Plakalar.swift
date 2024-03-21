//
//  Plakalar.swift
//  PlakaEzberletici
//
//  Created by Oğulcan Baytimur on 13/11/2023.
//

import Foundation

struct City: Codable{
    var name: String
    var plate: String
    let randomOffSet = Double.random(in: -10.0...10.0)
}

struct GameStatistics: Identifiable {
    let id = UUID()
    let city: City
    let wasCorrect: Bool
}

enum Constants {
    static let cities = [
        City(name: "Adana", plate: "01"),
        City(name: "Adıyaman", plate: "02"),
        City(name: "Afyon", plate: "03"),
        City(name: "Ağrı", plate: "04"),
        City(name: "Amasya", plate: "05"),
        City(name: "Ankara", plate: "06"),
        City(name: "Antalya", plate: "07"),
        City(name: "Artvin", plate: "08"),
        City(name: "Aydın", plate: "09"),
        City(name: "Balıkesır", plate: "10"),
        City(name: "Bilecik", plate: "11"),
        City(name: "Bingöl", plate: "12"),
        City(name: "Bitlis", plate: "13"),
        City(name: "Bolu", plate: "14"),
        City(name: "Burdur", plate: "15"),
        City(name: "Bursa", plate: "16"),
        City(name: "Çanakkale", plate: "17"),
        City(name: "Çankırı", plate: "18"),
        City(name: "Çorum", plate: "19"),
        City(name: "Denizli", plate: "20"),
        City(name: "Diyarbakır", plate: "21"),
        City(name: "Edirne", plate: "22"),
        City(name: "Elazığ", plate: "23"),
        City(name: "Erzincan", plate: "24"),
        City(name: "Erzurum", plate: "25"),
        City(name: "Eskişehir", plate: "26"),
        City(name: "Gaziantep", plate: "27"),
        City(name: "Giresun", plate: "28"),
        City(name: "Gümüşhane", plate: "29"),
        City(name: "Hakkari", plate: "30"),
        City(name: "Hatay", plate: "31"),
        City(name: "Isparta", plate: "32"),
        City(name: "İçel(Mersin)", plate: "33"),
        City(name: "İstanbul", plate: "34"),
        City(name: "İzmir", plate: "35"),
        City(name: "Kars", plate: "36"),
        City(name: "Kastamonu", plate: "37"),
        City(name: "Kayseri", plate: "38"),
        City(name: "Kırklareli", plate: "39"),
        City(name: "Kırşehir", plate: "40"),
        City(name: "Kocaeli", plate: "41"),
        City(name: "Konya", plate: "42"),
        City(name: "Kütahya", plate: "43"),
        City(name: "Malatya", plate: "44"),
        City(name: "Manisa", plate: "45"),
        City(name: "(Kahraman)Maraş", plate: "46"),
        City(name: "Mardin", plate: "47"),
        City(name: "Muğla", plate: "48"),
        City(name: "Muş", plate: "49"),
        City(name: "Nevşehir", plate: "50"),
        City(name: "Niğde", plate: "51"),
        City(name: "Ordu", plate: "52"),
        City(name: "Rize", plate: "53"),
        City(name: "Sakarya", plate: "54"),
        City(name: "Samsun", plate: "55"),
        City(name: "Siirt", plate: "56"),
        City(name: "Sinop", plate: "57"),
        City(name: "Sivas", plate: "58"),
        City(name: "Tekirdağ", plate: "59"),
        City(name: "Tokat", plate: "60"),
        City(name: "Trabzon", plate: "61"),
        City(name: "Tunceli", plate: "62"),
        City(name: "Urfa", plate: "63"),
        City(name: "Uşak", plate: "64"),
        City(name: "Van", plate: "65"),
        City(name: "Yozgat", plate: "66"),
        City(name: "Zonguldak", plate: "67"),
        City(name: "Aksaray", plate: "68"),
        City(name: "Bayburt", plate: "69"),
        City(name: "Karaman", plate: "70"),
        City(name: "Kırıkkale", plate: "71"),
        City(name: "Batman", plate: "72"),
        City(name: "Şırnak", plate: "73"),
        City(name: "Bartın", plate: "74"),
        City(name: "Ardahan", plate: "75"),
        City(name: "Iğdır", plate: "76"),
        City(name: "Yalova", plate: "77"),
        City(name: "Karabük", plate: "78"),
        City(name: "Kilis", plate: "79"),
        City(name: "Osmaniye", plate: "80"),
        City(name: "Düzce", plate: "81"),
    ]
    
    static let cardHeight: CGFloat = 200
    static let cardWidth: CGFloat = 300
    
    static let miniCardHeight: CGFloat = 100
    static let miniCardWidth: CGFloat = 150
    
    static let appTitle = "Plakalar"
    static let nextCardAnimationLength = 1.0
    static let cardFlipAnimationLength: Double = 0.4
    static var halfFlipAnimationLength: Double { Constants.cardFlipAnimationLength / 2 }
    static let flasfAnimationLength: Double = 0.33
    static let setupDuration: Double = 1.0
    
    static let lightBlue:  UInt =  0xBBE2EC
    static let darkBlue: UInt =  0x0D9276
    static let backgroundColor: UInt = 0xFFF6E9
}
