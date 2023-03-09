//
//  JokeType.swift
//  Dad jokes
//
//  Created by Balsa Komnenovic on 9.3.23..
//

import Foundation

enum JokeType: String, Codable, CaseIterable {
    case chuckNorris = "Chuck Norris"
    case dadJoke = "Dad Joke"
    case random = "Random"
    case yoMama = "Yo Mama"
    
    var type: String {
        switch self {
        case .chuckNorris:
            return "chucknorris"
        case .dadJoke:
            return "dadjoke"
        case .random:
            return "random"
        case .yoMama:
            return "yomama"
        }
    }
}
