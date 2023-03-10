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
    
    static var placeholder: Joke {
        Joke(status: 200, response: "success", joke: "What did the ocean say to the shore? Nothing, it just waved", type: "Dad Joke: ")
    }
}
