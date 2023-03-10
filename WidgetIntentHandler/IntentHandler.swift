//
//  IntentHandler.swift
//  WidgetIntentHandler
//
//  Created by Balsa Komnenovic on 9.3.23..
//

import Intents
import UIKit

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
}

//MARK: - ConfigurationIntentHandling
extension IntentHandler: ConfigurationIntentHandling {
    func provideSelectedChoiceOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<Choice>?, Error?) -> Void) {
        let choices = JokeType.allCases.map({ jokeType in
            Choice(identifier: jokeType.type, display: jokeType.rawValue)
        })
        let collection = INObjectCollection(items: choices)
        completion(collection, nil)
    }
}
