//
//  Joke.swift
//  Dad jokes
//
//  Created by Balsa Komnenovic on 9.3.23..
//

import Foundation

struct Joke: Codable {
    let status: Int
    let response: String
    let joke: String
    let type: String
}
