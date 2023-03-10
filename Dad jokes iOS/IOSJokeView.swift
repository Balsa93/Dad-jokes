//
//  ContentView.swift
//  Dad jokes iOS
//
//  Created by Balsa Komnenovic on 9.3.23..
//

import SwiftUI

struct IOSJokeView: View {
    var body: some View {
        VStack {
            NavigationView {
                JokeView()
                    .navigationTitle("Dad Jokes")
            }
            .navigationViewStyle(.stack)
        }
    }
}

struct IOSJokeView_Previews: PreviewProvider {
    static var previews: some View {
        IOSJokeView()
    }
}
