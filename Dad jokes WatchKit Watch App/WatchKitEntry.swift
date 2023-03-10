//
//  Dad_jokes_WatchKitApp.swift
//  Dad jokes WatchKit Watch App
//
//  Created by Balsa Komnenovic on 10.3.23..
//

import SwiftUI

@main
struct Dad_jokes_WatchKit_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
               AppTabView()
            }
        }
    }
}
