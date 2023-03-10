//
//  ContentView.swift
//  Dad jokes WatchKit Watch App
//
//  Created by Balsa Komnenovic on 10.3.23..
//

import SwiftUI

struct WatchKitJokeView: View {
    @State private var jokeString = "No Joke Available"
    @State private var fetching = false
    @State private var navigationTitle = ""
    @AppStorage("jokeType") var jokeType: JokeType = .dadJoke
    
    var body: some View {
        ZStack {
            if fetching {
                ProgressView()
            } else {
                VStack(alignment: .leading) {
                    Text(jokeString)
                        .minimumScaleFactor(0.5)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button {
                            Task {
                                await getJoke()
                            }
                        } label: {
                            Image(systemName: "goforward")
                        }
                        .frame(width: 40)
                    }
                }
                .padding(.horizontal)
            }
            Image("dad")
                .resizable()
                .opacity(0.3)
                .cornerRadius(8)
        }
        .navigationTitle(navigationTitle)
        .task {
            await getJoke()
        }
    }
    
    func getJoke() async {
        let url = "https://jokes.guyliangilsing.me/retrieveJokes.php?type=\(jokeType.type)"
        let apiService = APIService(urlString: url)
        fetching.toggle()
        defer {
            fetching.toggle()
        }
        do {
            let joke: Joke = try await apiService.getJSON()
            jokeString = joke.joke
            navigationTitle = String(joke.type.dropLast(2))
        } catch {
            jokeString = error.localizedDescription
        }
    }
}

struct WatchKitJokeView_Previews: PreviewProvider {
    static var previews: some View {
        WatchKitJokeView()
    }
}
